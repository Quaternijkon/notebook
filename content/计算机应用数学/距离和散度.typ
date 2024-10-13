#import "../../lib.typ": *

#set math.equation(numbering: none)

= 距离和散度

#set math.cases(reverse: true)
$ cases("欧几里得距离(Euclidean Distance)", "曼哈顿距离(Manhattan Distance)", "闵可夫斯基距离(Minkowski Distance)",  "余弦距离(Cosine Distance)")  "点距离(Point Distance)" $

$ cases("汉明距离(Hamming Distance)", "编辑距离(Edit Distance)") "字符串距离(String Distance)" $
#set math.cases(reverse: false)


== 点距离 Point Distance

物体之间的距离。

假设数据点来自 #mi(`M \subseteq \mathbb{R}^d`) 或 #mi(`M \subseteq \{0, 1\}^d`)  

度量：  

#mi(`D: M \times M \to \mathbb{R} \text{ 当且仅当对于所有 } x, y, z \in M`)  

#mi(`\Delta \, D(x, y) = 0 \Leftrightarrow x = y`) 

#mi(`\Delta \, D(x, y) = D(y, x)`)  

#mi(`\Delta \, D(x, z) \leq D(x, y) + D(y, z) \text{ – 三角不等式}`)

注意 #mi(`D(x, y) \geq 0`)

*证明：*  

#mi(`D(x, y) + D(y, x) \geq D(x, x)`)  

由此得出 #mi(`2D(x, y) \geq D(x, x) \geq 0`) 并且 #mi(`D(x, y) \geq 0`)


我们称 $D$ 为距离函数。 $D$ 可以用于聚类等。

*I. 欧几里得距离* 

#mitex(`D_{l_2}(x, y) = \|x - y\|_2 = \sqrt{\sum_{i=1}^{d} |x_i - y_i|^2}`)  
 
*II. 曼哈顿距离* 

#mitex(`D_{l_1}(x, y) = \sum_{i=1}^{d} |x_i - y_i|`)  
 
*III. 明科夫斯基距离* 

#mitex(`D_{l_p}(x, y) = \|x - y\|_p = \left(\sum_{i=1}^{d} |x_i - y_i|^p\right)^{\frac{1}{p}}`)  

它是欧几里得距离和曼哈顿距离的广义形式。

#figure(
  image("img/2-1.png", width: 30%),
  caption:[
    +  Euclidean 直线距离
    + Manhattan 出租车距离
    + Equivalent Manhattan
  ]
)

*IV. 标准化欧氏距离* 

每个分量都有相同的均值和方差。

#mitex(`x^* = \frac{x - m}{s}`)  

#mitex(`d(x, y) = \sqrt{\sum_{i=1}^{d} \left(\frac{x_i - y_i}{s_i}\right)^2}`)


== 字符串距离 String Distance

*I. 汉明距离* 

符号不同的位置数。  

将一个字符串转换成另一个字符串所需的最少替换次数。

#mi(`c = a \oplus b`)，其中 $a$ 和 $b$ 具有相同的长度。  
计算  $c$  中有多少个“1”。  
在网络中广泛使用。

*II. 编辑距离*  
计算将一个字符串转换为另一个字符串所需的最小操作次数。  
操作符：
- 插入一个符号。
- 删除一个符号。
- 将符号  $x$  替换为符号  $y$ （#mi(`\( y \neq x \)`)），例如：#mi(`\( u x v \rightarrow u y v \)`)。  
它是汉明距离的广义形式。

#mi(`lev(a, b) = \begin{cases} |a| & \text{if } |b| = 0 \\ |b| & \text{if } |a| = 0 \\ lev(\text{tail}(a), \text{tail}(b)) & \text{if } \text{head}(a) = \text{head}(b) \\ 1 + \min \{lev(\text{tail}(a), b), lev(a, \text{tail}(b)), lev(\text{tail}(a), \text{tail}(b)) \} & \text{otherwise} \end{cases}`)

== 集合距离 Set Distance

Jaccard 距离与相似度。

Jaccard 相似度  

#mitex(`J(A, B) = \frac{|A \cap B|}{|A \cup B|}`)  

Jaccard 距离 

#mitex(`J_S(A, B) = 1 - J(A, B) = \frac{|A \cup B| - |A \cap B|}{|A \cup B|}`)

== 变量与分布之间的距离 Distance between variables and distributions

*熵*

*定义 1.5.1* 随机变量  $X$  的（Shannon）熵为：

#mitex(`\begin{align*}
H[X] &= -\sum_x P(X = x) \log P(X = x) \quad \text{(离散情况)} \\
     &= -E[\log P(X)]
\end{align*}
`)  

*给定  $Y$  的条件熵  $X$ *：

#mitex(`\begin{align*}
H[X|Y] &= \sum_y P(Y = y) \sum_x P(X = x | Y = y) \log P(X = x | Y = y) \\
       &= -E[\log P(X|Y)] \\
       &= H[X,Y] - H[Y]
\end{align*}
`)

*Shannon 熵的性质：*

1. #mi(`H[X] \geq 0`)  
2. #mi(`H[X] = 0`)，如果存在 #mi(`x_0`)：#mi(`X = x_0`)  
3. 如果 #mi(`X`) 可以取 #mi(`n < \infty`) 个不同值（具有正概率），则  
   #mi(`H[X] \leq \log n`)  
   如果 #mi(`X`) 是均匀分布的，#mi(`H[X] = \log n`)。  
4. #mi(`H[X] + H[Y] \geq H[X,Y]`)  
   当且仅当 #mi(`X`) 和 #mi(`Y`) 独立时取等号。  
5. #mi(`H[X,Y] \geq H[X]`)  
6. #mi(`H[X|Y] \geq 0`)  
   当且仅当 #mi(`X`) 在几乎所有 #mi(`Y`) 给定的情况下是常数时取等号。  
7. #mi(`H[X|Y] \leq H[X]`)  
   当且仅当 #mi(`X`) 独立于 #mi(`Y`) 时取等号。  
8. #mi(`H[f(X)] \leq H[X]`)  
   对于任何可测函数 #mi(`f`)，当且仅当 #mi(`f`) 可逆时取等号。

*引理 1.5.1（Shannon 熵的链式法则）*  

设 #mi(`X_1, X_2, \dots, X_n`) 是在同一概率空间上的离散值随机变量，则：

#mi(`H[X_1, X_2, \dots, X_n] = H[X_1] + \sum_{i=2}^{n} H[X_i | X_1, X_2, \dots, X_{i-1}]`)

*定义 1.5.2（Shannon 熵的一般情况）*  

相对于参考测度 #mi(`\rho`)，分布为 #mi(`\mu`) 的随机变量 #mi(`X`) 的 Shannon 熵为：

#mitex(`H_{\rho}[x] = -E_{\mu} \left[ \log \frac{d\mu}{d\rho} \right]`)

*II. 交叉熵*

两个概率分布 \( p \) 和 \( q \) 之间的交叉熵，基于相同的事件集，衡量的是使用针对估计概率分布 \( q \) 优化的编码方案来识别事件时，所需的平均比特数，而不是使用真实分布 \( p \)。

给定真实分布 \( p \)，使用非真实分布 \( q \) 指定策略略微消除系统不确定性所需付出努力的大小。

假设 \( p \) 是真实分布，\( q \) 是估计的（非真实）分布。  
使用 \( p \) 来识别一个事件时，所需的平均比特数为：

#mi(`H(p) = - \sum_{i=1}^{n} p_i \log p_i`)

而使用 \( q \) 来表示该数值：

#mi(`
H(p, q) = - \sum_{i=1}^{n} p_i \log q_i \\
        = \sum_{i=1}^{n} p_i \log \frac{1}{q_i} \quad \leftarrow \text{离散情况下的交叉熵}
`)

对于连续情况：

#mi(`
H(p, q) = E_p[\log q] \\
        = - \int_x p(x) \log q(x) dx
`)

*应用：* 交叉熵损失函数与逻辑回归。

真实概率 \( p_i \) 是真实标签，而给定的分布 \( q_i \) 是模型当前预测值。

考虑一个二元回归模型。  
在逻辑回归中，概率由逻辑函数 #mi(`g(z) = \frac{1}{1 + e^{-z}}`) 给出，其中 #mi(`z`) 是输入 #mi(`x`) 的线性函数。

输出为 1 的概率为：

#mi(`
q_{y=1} = \hat{y} = g(w \cdot x) = \frac{1}{1 + e^{-w \cdot x}} \\
q_{y=0} = 1 - \hat{y}
`)

从定义我们可以得出：

#mi(`p \in \{y, 1 - y\}, \quad y \in \{1, 0\}, \hat{y} = \frac{1}{1 + e^{-w \cdot x}}`)

我们使用交叉熵来衡量 \( p \) 和 \( q \) 之间的差异，

#mitex(`
H(p, q) = -\sum_i p_i \log q_i = -y \log \hat{y} - (1 - y) \log (1 - \hat{y})
`)

逻辑损失有时称为交叉熵损失或对数损失。 

逻辑回归的交叉熵损失的梯度与线性回归中平方误差损失的梯度相同。

#mitex(`
X = \begin{pmatrix}
1 & x_{11} & \dots & x_{1p} \\
1 & x_{21} & \dots & x_{2p} \\
\vdots & \vdots & \ddots & \vdots \\
1 & x_{n1} & \dots & x_{np}
\end{pmatrix} \in \mathbb{R}^{n \times (p+1)}
`)

#mitex(`
\hat{y}_i = f(x_{i1}, \dots, x_{ip}) = \frac{1}{1 + \exp(-\beta_0 - \beta_1 x_{i1} - \dots - \beta_p x_{ip})}
`)

#mitex(`
L(\beta) = - \sum_{i=1}^{N} \left[ y_i \log \hat{y}_i + (1 - y_i) \log (1 - \hat{y}_i) \right]
`)

那么：

#mitex(`
\frac{\partial}{\partial \beta} L(\beta) = X^T (\hat{Y} - Y)
`)

*证明：*


#mitex(`
\frac{\partial}{\partial \beta_0} \ln \frac{1}{1 + e^{-\beta_0 + k_0}} = \frac{e^{-\beta_0 + k_0}}{1 + e^{-\beta_0 + k_0}}
`)

#mitex(`
\frac{\partial}{\partial \beta_0} \ln \left( 1 - \frac{1}{1 + e^{-\beta_0 + k_0}} \right) = \frac{-1}{1 + e^{-\beta_0 + k_0}}
`)

#mitex(`
\frac{\partial L(\beta)}{\partial \beta} = - \sum_{i=1}^{N} \left[ y_i \cdot \frac{e^{-\beta_0 + k_0}}{1 + e^{-\beta_0 + k_0}} - (1 - y_i) \cdot \frac{1}{1 + e^{-\beta_0 + k_0}} \right]
`)

#mitex(`
= - \sum_{i=1}^{N} [y_i - \hat{y}_i] = \sum_{i=1}^{N} (\hat{y}_i - y_i)
`)

#mitex(`
\frac{\partial}{\partial \beta_1} \ln \frac{1}{1 + e^{-\beta_1 x_{i1} + k_1}} = \frac{x_{i1} e^{k_1}}{e^{\beta_1 x_{i1}} + e^{k_1}}
`)

#mitex(`
\frac{\partial}{\partial \beta_1} \ln \left( 1 - \frac{1}{1 + e^{-\beta_1 x_{i1} + k_1}} \right) = \frac{-x_{i1} e^{\beta_1 x_{i1}}}{e^{\beta_1 x_{i1}} + e^{k_1}}
`)

#mitex(`
\frac{\partial L(\beta)}{\partial \beta_1} = - \sum_{i=1}^{N} x_{i1} (y_i - \hat{y}_i) = \sum_{i=1}^{N} x_{i1} (\hat{y}_i - y_i)
`)

*III. 相对熵或 K-L 散度*

给定两个概率分布 \( P \) 和 \( Q \)，

#mitex(`
D_{KL}(P \| Q) = \sum_{x \in \mathcal{X}} p(x) \log \frac{P(x)}{Q(x)}
`)

*注意：* 该值不对称！

对于连续情况：

#mitex(`
D_{KL}(P \| Q) = \int_{-\infty}^{\infty} p(x) \log \frac{p(x)}{q(x)} d(x)
`)

更一般地说，如果 \( P \) 和 \( Q \) 是可测空间 \( \mathcal{X} \) 上的概率测度，并且 \( P \) 相对于 \( Q \) 是绝对连续的，则：

#mitex(`
D_{KL}(P \| Q) = \int_{x \in \mathcal{X}} \log \frac{P(dx)}{Q(dx)} P(dx)
`)

*示例：*

对于 \( P \)：

- 二项分布，参数 \( p = 0.4 \)，\( N = 2 \)

对于 \( Q \)：

- 均匀分布，\( p = 1/3 \)

对应的概率表：

#mitex(`
\mathcal{X}: \quad 0 \quad 1 \quad 2 \\
P(x): \quad \frac{9}{25} \quad \frac{12}{25} \quad \frac{4}{25} \\
Q(x): \quad \frac{1}{3} \quad \frac{1}{3} \quad \frac{1}{3}
`)



#mitex(`
D_{KL}(P \| Q) &= \sum_{x \in \mathcal{X}} P(x) \ln \frac{P(x)}{Q(x)} \\
               &= \frac{9}{25} \ln \left( \frac{9/25}{1/3} \right) + \frac{12}{25} \ln \left( \frac{12/25}{1/3} \right) + \frac{4}{25} \ln \left( \frac{4/25}{1/3} \right) \\
               &= \frac{1}{25} \left( 32 \ln 2 + 55 \ln 3 - 50 \ln 5 \right) \\
               &= 0.0853
`)

#mitex(`
D_{KL}(Q \| P) &= \sum_{x \in \mathcal{X}} Q(x) \ln \frac{Q(x)}{P(x)} \\
               &= \frac{1}{3} \ln \left( \frac{1/3}{9/25} \right) + \frac{1}{3} \ln \left( \frac{1/3}{12/25} \right) + \frac{1/3} \ln \left( \frac{1/3}{4/25} \right) \\
               &= 0.0975
`)



*应用：贝叶斯更新*

KL 散度可以用于衡量从先验分布 #mi(`P(x)`) 到后验分布 #mi(`p(x|I)`) 中的信息增益。

如果发现某些新事实 #mi(`Y = y`)，可以通过贝叶斯定理将后验分布从 #mi(`p(x|I)`) 更新为新的后验分布 #mi(`p(x|y, I)`)，具体表达为：

#mitex(`
p(x|y, I) = \frac{p(y|x, I) p(x|I)}{p(y|I)}
`)

#mitex(`
D_{KL}(p(x|y, I) \| p(x|I)) = \sum_x p(x|y, I) \log \left( \frac{p(x|y, I)}{p(x|I)} \right)
`)



*IV. Jensen-Shannon (JS) 散度*

JS 散度是 KL 散度的对称和平滑版本。

#mitex(`
D_{JS} = \frac{1}{2} KL(p \| \frac{p+q}{2}) + \frac{1}{2} KL(q \| \frac{p+q}{2})
`)



*应用：生成对抗网络（GAN）*

为了学习生成器的分布 #mi(`p_g`) 在数据 #mi(`x`) 上的分布，我们定义了输入噪声变量的先验分布 #mi(`p_z(Z)`)。表示一个从 #mi(`G(z; \theta_g)`) 到数据空间的映射，其中 #mi(`G`) 是由参数 #mi(`\theta_g`) 表示的可微函数，该函数由多层感知机表示。

我们定义了第二个多层感知机 #mi(`D(X; \theta_d)`)。训练 #mi(`D`) 以最大化对真实样本和生成样本的正确分类概率。同时训练 #mi(`G`) 以最小化 #mi(`\log(1 - D(G(z)))`)。换句话说，#mi(`D`) 和 #mi(`G`) 进行双人极小极大博弈，目标函数为 #mi(`V(G, D)`)。

#mitex(`\min_G \max_D V(D, G) = E_{X \sim P_{\text{data}}(X)} [\log D(X)] + E_{z \sim p_z(z)} [\log (1 - D(G(z)))]`)



我们首先考虑对任何给定的 #mi(`G`) 来优化 #mi(`D`)。

*引理 1.5.2* 对固定的 #mi(`G`)，最优的 #mi(`D`) 是：

#mitex(`D^*_G(x) = \frac{p_{\text{data}}(x)}{p_{\text{data}}(x) + p_g(x)}`)

*证明*：对给定的 #mi(`G`)，#mi(`D`) 的训练准则是最大化以下目标函数：


#mitex(`
V(G, D) &= \int_x p_{\text{data}}(x)\log(D(x))dx + \int_z p_z(z)\log(1 - D(G(z)))dz \\
        &= \int_x p_{\text{data}}(x)\log(D(x)) + p_g(x)\log(1 - D(x))dx
`)


对于任意 #mi(`(a, b) \in \mathbb{R}^2 \setminus \{0, 0\}`)，#mi(`y \to a\log(y) + b\log(1 - y)`) 在 #mi(`[0,1]`) 中的最大值为 #mi(`\frac{a}{a+b}`)。

#mi(`D`) 的训练目标可以解释为最大化估计条件概率 #mi(`P(Y = y|x)`) 的对数似然函数，其中 #mi(`Y`) 表示 #mi(`x`) 是否来自 #mi(`p_{\text{data}}`)（#mi(`y = 1`)）或来自 #mi(`p_g`)（#mi(`y = 0`)）。

以下是图片内容翻译成中文，数学公式已按要求放入#mi(``)中：

---

极小极大变为：


#mitex(`
C(G) &= \max_D V(G, D) \\
     &= E_{x \sim p_{\text{data}}} [\log D^*_G(x)] + E_{z \sim p_z} [\log(1 - D^*_G(G(z)))] \\
     &= E_{x \sim p_{\text{data}}} [\log D^*_G(x)] + E_{x \sim p_g} [\log(1 - D^*_G(x))] \\
     &= E_{x \sim p_{\text{data}}} \left[\log \frac{p_{\text{data}}(x)}{p_{\text{data}}(x) + p_g(x)}\right] + E_{x \sim p_g} \left[\log \frac{p_g(x)}{p_{\text{data}}(x) + p_g(x)}\right]
`)

*定理 1.5.3*

#mi(`C(G)`) 的全局最小值当且仅当 #mi(`p_g = p_{\text{data}}`) 时取得。在这个点上，#mi(`C(G)`) 的值为 #mi(`-\log 4`)。

*证明*：对于 #mi(`p_g = p_{\text{data}}`)，#mi(`D^*_G(x) = \frac{1}{2}`)。

因此，我们发现 #mi(`C(G) = \log \frac{1}{2} + \log \frac{1}{2} = -\log 4`)。

为了证明这是 #mi(`C(G)`) 能达到的最优值，且仅当 #mi(`p_g = p_{\text{data}}`) 时达到，观察到：

#mitex(`E_{x \sim p_{\text{data}}} [-\log 2] + E_{x \sim p_g} [-\log 2] = -\log 4`)



通过从 #mi(`C(G) = V(D^*_G, G)`) 中减去该表达式，我们得到：


#mitex(`
C(G) &= -\log(4) + D_{KL} \left( p_{\text{data}} \| \frac{p_{\text{data}} + p_g}{2} \right) + D_{KL} \left( p_g \| \frac{p_{\text{data}} + p_g}{2} \right) \\
     &= -\log(4) + 2 \cdot D_{JS}(p_{\text{data}} \| p_g)
`)

由于 #mi(`JS`) 散度总是非负的，并且只有在两者相等时才为零，我们证明 #mi(`c^* = -\log(4)`) 且唯一的解是 #mi(`p_g = p_{\text{data}}`)。

*V. Wasserstein 距离*（推土机距离）

如果 #mi(`p`) 和 #mi(`q`) 非常不同，即它们彼此距离很远且没有重叠，那么它们的 #mi(`KL`) 散度没有意义，#mi(`J-S`) 散度是常数，因此梯度变为0。

#mitex(`
w(p, q) = \inf_{\gamma \in \Gamma(u, v)} \left( E_{(x, y) \sim \gamma} d(x, y)^p \right)^{1/p}
`)

其中 #mi(`\Gamma(u, v)`) 是所有 #mi(`u`) 和 #mi(`v`) 的耦合集合，#mi(`W_\infty(u, v)`) 定义为 #mi(`\lim_{p \to +\infty} W_p(u, v)`)。

W-距离也可用于比较离散和连续分布。

*应用：Wasserstein GAN*

*为什么 Wasserstein 距离比 #mi(`JS`) 或 #mi(`KL`) 更好？*

假设我们有两个概率分布 #mi(`P, Q`)。

#mi(`\forall (x, y) \in P, x = 0, y \sim U(0, 1)`)

#mi(`\forall (x, y) \in Q, x = \theta, 0 \leq \theta \leq 1 \text{ and } y \sim U(0, 1)`)

#figure(
  image("img/2-2.png", width: 50%),
  caption: "P, Q have no overlap"
)

When $theta != 0$:

#mitex(`
D_{KL}(P \| Q) &= \sum_{x=0;y \sim U(0,1)} 1 \cdot \log \frac{1}{0} = +\infty \\
D_{KL}(Q \| P) &= \sum_{x=\theta;y \sim U(0,1)} 1 \cdot \log \frac{1}{0} = +\infty
`)

#mitex(`
D_{JS}(P, Q) &= \frac{1}{2} \left( \sum_{x=0;y \sim U(0,1)} 1 \cdot \log \frac{1}{\frac{1}{2}} + \sum_{x=0;y \sim U(0,1)} 1 \cdot \log \frac{1}{\frac{1}{2}} \right) = \log 2
`)

#mi(`
W(P, Q) &= |\theta|
`)

当 #mi(`\theta = 0`) 时，#mi(`P, Q`) 完全重叠：

#mitex(`
D_{KL}(P \| Q) = D_{KL}(Q \| P) = D_{JS}(P, Q) &= 0 \\
W(P, Q) = 0 &= |\theta|
`)

只有 #mi(`W`) 提供了平滑的度量。

使用 W-距离作为 GAN 的损失函数。

在 #mi(`\Pi(p_r, p_g)`) 中穷尽所有可能的联合分布以计算 #mi(`\inf_{\gamma \sim \Pi(p_r, p_g)}`) 是不可行的。

基于 Kantorovich-Rubinstein 对偶性：

#mitex(`
W(p_r, p_g) &= \frac{1}{K} \sup_{\|f\|_L \leq K} \left( E_{x \sim p_r} [f(x)] - E_{x \sim p_g} [f(x)] \right)
`)

其中 #mi(`\sup`) 是 #mi(`\inf`) 的相对概念。

现在我们想要衡量最小上界（最大值）。
