## 實作：通用的爬山演算法架構

### 前言

在上一篇文章中，我們介紹了如何用 JavaScript 來尋找「單變數函數」的最高點。在這篇文章中，我們會將這個程式抽象化之後，成為一個通用的爬山演算法架構，以便能夠尋找任何函數的最高點。

### 通用的爬山演算法架構

檔案：hillClimbing.py

```py
def hillClimbing(s, maxGens, maxFails):   # 爬山演算法的主體函數
    print("start: ", s.str())             # 印出初始解
    fails = 0                             # 失敗次數設為 0
    # 當代數 gen<maxGen，且連續失敗次數 fails < maxFails 時，就持續嘗試尋找更好的解。
    for gens in range(maxGens):
        snew = s.neighbor()               #  取得鄰近的解
        sheight = s.height()              #  sheight=目前解的高度
        nheight = snew.height()           #  nheight=鄰近解的高度
        if (nheight >= sheight):          #  如果鄰近解比目前解更好
            print(gens, ':', snew.str())  #    印出新的解
            s = snew                      #    就移動過去
            fails = 0                     #    移動成功，將連續失敗次數歸零
        else:                             #  否則
            fails = fails + 1             #    將連續失敗次數加一
        if (fails >= maxFails):
            break
    print("solution: ", s.str())          #  印出最後找到的那個解
    return s                              #    然後傳回。

```

### 抽象的解答類別

檔案：solution.py

```py
class Solution: # 解答的物件模版 (類別)
    def __init__(self, v, step = 0.01):
        self.v = v       # 參數 v 為解答的資料結構
        self.step = step # 每一小步預設走的距離

    # 以下兩個函數至少需要覆蓋掉一個，否則會無窮遞迴
    def height(self): # 爬山演算法的高度函數
        return -1*self.energy()               # 高度 = -1 * 能量

    def energy(self): # 尋找最低點的能量函數
        return -1*self.height()               # 能量 = -1 * 高度
```

### 實例 1 ：求解平方根

在此，我們將以求解 4 的平方根為例，測試一下上述演算法是否能夠找到正確的解答。

檔案：solutionNumber.py (單變數函數，求平方根)

```py
from py6.ai import hillClimbing # 引入解答類別
from py6.ai.solution import Solution
import random

class SolutionNumber(Solution):
    def neighbor(self): # 單變數解答的鄰居函數。
        x = self.v
        dx= self.step               # x:解答 , dx : 移動步伐大小
        xnew = x+dx if random.random() > 0.5 else x-dx # 用亂數決定向左或向右移動
        return SolutionNumber(xnew) # 建立新解答並傳回。

    def energy(self):               # 能量函數
        x = self.v                  # x:解答
        return abs(x*x-4)           # 能量函數為 |x^2-4|

    def str(self): # 將解答轉為字串，以供印出觀察。
        return "energy({:.3f})={:.3f}".format(self.v, self.energy())

```

檔案：hillClimbingNumber.py

```py
from py6.ai.hillClimbing import hillClimbing # 引入爬山演算法類別
from solutionNumber import SolutionNumber # 引入平方根解答類別

# 執行爬山演算法 (從「解答=0.0」開始尋找, 最多十萬代、失敗一千次就跳出。
hillClimbing(SolutionNumber(0.0), 100000, 1000)
```

執行結果：

```
PS D:\ccc\course\ai\python\02-optimize> python .\hillClimbingNumber.py
start:  energy(0.000)=4.000
0 : energy(-0.010)=4.000
3 : energy(-0.020)=4.000
4 : energy(-0.030)=3.999
9 : energy(-0.040)=3.998
10 : energy(-0.050)=3.998
...
417 : energy(-1.960)=0.158
419 : energy(-1.970)=0.119
420 : energy(-1.980)=0.080
421 : energy(-1.990)=0.040
424 : energy(-2.000)=0.000
solution:  energy(-2.000)=0.000
```

您可以看到上述程式最後找到 4 的平方根為 -2，這算是對的，因為我們在能量函數中沒有規定平方根必須是正的，如果要求要是正的，那就可以為負數加上一個懲罰函數就行了。

### 實例 2 ：多變數函數的最佳化

在此，我們將以求解 $`x^2+3y^2+z^2-4x-3y-5z+8`$ 這個函數的最低點，看看上述演算法對多變數函數是否能正常運作。

檔案：solutionArray.py

```py
from py6.ai.solution import Solution
from random import random, randint

class SolutionArray(Solution):
    def neighbor(self):    #  多變數解答的鄰居函數。
        nv = self.v.copy()                   #  nv=v.clone()=目前解答的複製品
        i = randint(0, len(nv)-1) #  隨機選取一個變數
        if (random() > 0.5):                    #  擲骰子決定要往左或往右移
            nv[i] += self.step
        else:
            nv[i] -= self.step
        return SolutionArray(nv)                    #  傳回新建的鄰居解答。

    def energy(self):      #  能量函數
        x, y, z =self.v
        return x*x+3*y*y+z*z-4*x-3*y-5*z+8         #  (x^2+3y^2+z^2-4x-3y-5z+8)

    def str(self):    #  將解答轉為字串的函數，以供列印用。
        return "energy({:s})={:f}".format(str(self.v), self.energy())
```

檔案： hillClimbingArray.py

```py
from py6.ai.hillClimbing import hillClimbing # 引入爬山演算法類別
from solutionArray import SolutionArray # 引入平方根解答類別

# 執行爬山演算法 (從「解答=0.0」開始尋找, 最多十萬代、失敗一千次就跳出。
hillClimbing(SolutionArray([1,1,1]), 100000, 1000)
```

執行結果

```
PS D:\ccc\course\ai\python\02-optimize> python .\hillClimbingArray.py
start:  energy([1, 1, 1])=1.000000
0 : energy([1, 0.99, 1])=0.970300
1 : energy([1.01, 0.99, 1])=0.950400
2 : energy([1.02, 0.99, 1])=0.930700
4 : energy([1.02, 0.98, 1])=0.901600
...
854 : energy([2.000000000000001, 0.49999999999999956, 2.4799999999999907])=-2.999600
856 : energy([2.000000000000001, 0.49999999999999956, 2.4899999999999904])=-2.999900
859 : energy([2.000000000000001, 0.49999999999999956, 2.4999999999999902])=-3.000000
solution:  energy([2.000000000000001, 0.49999999999999956, 2.4999999999999902])=-3.000000
```

您可以發現這個程式最後找到的解答是 (x, y, z)=(2, 0.5, 2.5)，其能量值為 -3，也就是高度值為 3。

### 實例 3 ：線性聯立方程組求解

本範例求解的線性聯立方程組，可以用矩陣描述如下：

```math
\begin{cases}a_{1,1}x_{1} + a_{1,2}x_{2} + \cdots + a_{1,n}x_{n}=  b_{1} \\  a_{2,1}x_{1} + a_{2,2}x_{2} + \cdots + a_{2,n}x_{n}=  b_{2} \\ \vdots \quad \quad \quad \vdots \\  a_{m,1}x_{1} + a_{m,2}x_{2} + \cdots + a_{m,n}x_{n}=  b_{m} \end{cases}
```

這種線性聯立方程組，可以寫為矩陣相乘的形式如下：

```math
A x = b
```

其中的 A 為矩陣、x 與 b 均為「列向量」。

```math
A=\begin{bmatrix}a_{1,1} & a_{1,2} & \cdots & a_{1,n} \\ a_{2,1} & a_{2,2} & \cdots & a_{2,n} \\ \vdots & \vdots & \ddots & \vdots \\ a_{m,1} & a_{m,2} & \cdots & a_{m,n} \end{bmatrix},\quad x= \begin{bmatrix} x_1 \\ x_2 \\ \vdots \\ x_n \end{bmatrix},\quad b= \begin{bmatrix} b_1 \\ b_2 \\ \vdots \\ b_m \end{bmatrix}
```

這類問題想要求的答案是 x 的值，也就是在 A 與 b 都已知的情況之下，求符合條件的 x 是多少？  

我們使用的測試範例如下：

```
A=[[1,1],[1,-1]]
B=[[5][1]]
```

也就是求下列方程組的解答。

```
x1+x2=5
x1-x2=1
```

以下是我們表示解答的程式碼，其中引入了 matrix 這個矩陣相乘的函式庫。

檔案：solutionEquations.py

```py
"""
A X = B ，求 X 是多少？

範例：題目來源: http://mail.im.tku.edu.tw/~idliaw/LinTup/99ie/99IEntu.pdf

4a+3b+6c=1
1a+1b+2c=2
2a+1b+3c=-1
"""

from random import random, randint
import numpy as np
from numpy import linalg as LA
from py6.ai.solution import Solution

A = np.array([[4,3,6],[1,1,2],[2,1,3]])
B = np.array([[1,2,-1]]).transpose()

class SolutionEquation(Solution):
    def neighbor(self):    #  多變數解答的鄰居函數。
        nx = self.v.copy()              #  複製目前解的矩陣
        rows = nx.shape[0]
        #  修改了這裡：最多改變 n 個維度(只是某些 n 維的例子可以，無法確定一定可以，除非能證明能量函數只有一個低點)
        for _ in range(rows):         #  原本只改一維，會找不到！
            i = randint(0, rows-1) #  隨機選取一個變數
            if (random() > 0.5):                    #  擲骰子決定要往左或往右移
                nx[i][0] += self.step * random()  #  原本是 nx.m[i][0] += self.step 
            else:
                nx[i][0] -= self.step * random()  #  原本是 nx.m[i][0] -= self.step 

        return SolutionEquation(nx)                    #  傳回新建的鄰居解答。

    def energy(self):      #  能量函數:計算 ||AX-B||，也就是 ||Y-B||
        X = self.v
        Y = A.dot(X)
        return LA.norm(Y-B, 2)

    def str(self):    #  將解答轉為字串的函數，以供列印用。
        return "energy({:s})={:f}".format(str(self.v.transpose()), self.energy())

    @classmethod
    def zero(cls):
        return SolutionEquation(np.zeros((3,1)))
```

接著是爬山演算法的主體，我們從解答 `x=[0,0]` 開始尋找：

檔案：hillClimbingEquations.py

```py
from py6.ai.hillClimbing import hillClimbing # 引入爬山演算法類別
from solutionEquation import SolutionEquation # 引入平方根解答類別

# 執行爬山演算法 (從「解答=0.0」開始尋找, 最多十萬代、失敗一千次就跳出。
hillClimbing(SolutionEquation.zero(), 100000, 1000)
# hillClimbing(solutionEquations.zero(), 100000, 1000);
```


執行結果如下：

```
PS D:\ccc\course\ai\python\02-optimize> python .\hillClimbingEquation.py
start:  energy([[0. 0. 0.]])=2.449490
0 : energy([[ 0.         -0.00103355  0.00814057]])=2.428409
1 : energy([[0.         0.01016647 0.00814057]])=2.410994
2 : energy([[0.00104252 0.01016647 0.00814057]])=2.409447
4 : energy([[0.00104252 0.01707348 0.00814057]])=2.398969
...
6717 : energy([[-4.996933    2.99871146  1.99864253]])=0.001241
7415 : energy([[-4.996933    2.99871146  1.99859632]])=0.001209
7460 : energy([[-4.99970816  3.0024661   1.99859632]])=0.001171
7540 : energy([[-4.99792451  2.99993424  1.99859632]])=0.000868
solution:  energy([[-4.99792451  2.99993424  1.99859632]])=0.000868
```

您可以看到最後找到的解為 `x=[-5, 3, 2]` ，這個結果確實是下列方程組的解答：

```
4a+3b+6c=1
1a+1b+2c=2
2a+1b+3c=-1
```

於是我們用這個爬山演算法的架構解決了線性聯立方程組的求解問題。

### 結語

當然、上述的架構不只可以解這些問題，甚至可以用來解像「線性規劃、神經網路優化....」等等各式各樣的問題，前提是您必須自行設計 solution 類別的 neighbor(), energy() 函數，然後寫個主程式呼叫爬山演算法就行了。

### 參考文獻
* [Wikipedia:Hill climbing](http://en.wikipedia.org/wiki/Hill-climbing)
* [維基百科：爬山演算法](http://zh.wikipedia.org/wiki/%E7%88%AC%E5%B1%B1%E7%AE%97%E6%B3%95)



