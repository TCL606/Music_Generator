# Matlab音乐合成实验报告

---

无03 唐昌礼 2020010694

---

## 一、实验目的

1. 了解音乐基础知识，使用matlab编程合成音乐。
2. 增进对傅里叶级数、傅里叶变换的理解。
3. 熟悉matlab编程。

## 二、实验平台

我的所有代码均在 MATLAB R2020b 上编写，且全部能够正常运行。

## 三、实验内容

### 1.2.1 简单的合成音乐

#### 1 应用“十二平均律”合成《东方红》片段

首先，我先将可能用到的所有音调频率，制成表格，以便查询。具体的生成代码如下：

~~~matlab
base = [220, 440, 880]';
power = linspace(0, 1 - 1/12, 12);
rate = 2.^power;
tunes = base * rate;
~~~

上述代码中，最后的`tunes`变量，就是所有可能用到的频率矩阵。

接下来我对东方红片段进行编码，将每个音符转换成频率矩阵`tunes`中的元素，并为每个音符标注持续的节拍数。大致编码方式如下：

~~~matlab
song = [
    tunes(3, 1), 1;
    tunes(3, 1), 0.5;
    % ...
    % ...
]
~~~

接下来，根据`song`变量的编码结果与采样率，依次生成对应频率的正弦波，并将各个正弦波按次序合并，生成曲调。最后利用`sound`函数播放合成的音乐。

我将生成的音乐通过`plot`函数画出来。由于没有任何幅度上的调整，所以音乐信号的幅度始终保持为1，`plot`出来的结果就是多个矩形的合并。

![1.2.1.1](img/1.2.1.1.png)

该题代码位于`hw1_2_1_1.m`中。

#### 2 为音乐添加包络

大作业指导书中，指出了包络的时间特征：冲激、衰减、持续、消失。原图中是分段折线函数。在我的试验中，我发现如果包络曲线不够平滑，如分段函数那样有折线的点，那合成的乐曲听上去就不够悦耳。因此，我使用了以下形式的函数：
$$
f(x)=bx^ce^{-ax}
$$
该形式的函数曲线有着如图所示的趋势：

![env](img/env.png)

能够比较好的契合包络的实际特征。

在与同学探讨并仔细调参后，我将包络函数定为如下表达式：
$$
f(x)=4x^{0.5}e^{-x}
$$
接下来，我用包络函数去乘原本的乐音，并在相邻乐音间进行一定的重叠。重叠的具体做法是：首先指定要重叠的时间长度，根据采样率计算出要重叠的采样点的个数，然后在重叠处将前后两个信号相加。

使用包络并将信号部分重叠的代码如下所示：

~~~matlab
shiftTime = beat / 5;
shiftLen = shiftTime * fs;
t = linspace(-shiftTime, time , time * fs + shiftLen)';
sub_melody = sin(2 * pi * song(i, 1) .* t);
scale = Envelope(sub_melody);
sub_melody = sub_melody .* scale';
if max(sub_melody) ~= 0
	sub_melody = sub_melody / max(sub_melody);
end
melLen = length(melody);
subLen = length(sub_melody);
melody = [
    melody(1:melLen - shiftLen); 
    melody(melLen - shiftLen + 1: melLen) + sub_melody(1: shiftLen);
    sub_melody(shiftLen + 1: subLen) 
];
~~~

得到乐曲的波形如下

![1.2.1.2](img/1.2.1.2.png)

听上去也十分悦耳。

包络函数位于`Envelope.m`中，该题代码位于`hw1_2_1_2.m`中。

#### 3 将音乐分别升高八度、降低八度、升高半个音阶

代码与第2题基本一样。

升高八度与降低八度时，只需在使用`sound`函数时，改变采样率即可。代码如下

~~~matlab
% High
sound(melody, fs * 2);

% Low
sound(melody, fs / 2);
~~~

升高半个音阶，只需对原音乐波形进行`resample`，将原本采样率`fs`换为`fs*2^(1/12)`，再以`fs`为采样率播放音乐，这样就相当于所有频率均升高了`2^(1/12)`倍，即半个音阶。代码如下

~~~matlab
RHF = resample(melody, fs, round(fs * 2^(1/12)));
sound(RHF, fs);
~~~

该题代码位于`hw1_2_1_3.m`中。

#### 4 增加谐波

在每个音调的波形中（假设基波幅度为1），加入幅度为0.2的二次谐波，幅度为0.3的三次谐波。在代码中体现为

~~~matlab
sub_melody = sin(2 * pi * song(i, 1) .* t) + 0.2 * sin(2 * pi * song(i, 1) .* t * 2) + 0.3 * sin(2 * pi * song(i, 1) .* t * 3);
~~~

使用`sound`函数播放，发现旋律更加”厚重“了，音色也更加优美。

查看波形图

![1.2.1.4](img/1.2.1.4.png)

波形与`hw1_2_1_2`的类似，为了看出具体的区别，我将波形放大200倍查看，如下图所示

![1.2.1.4_2](img/1.2.1.4_2.png)

波形中多了一些谐波，谐波为音乐带来了不同的音色。

该题代码位于`hw1_2_1_4.m`中。

#### 5 自选音乐合成

我选用歌曲《从别后》，将它的简谱译为我设置的音乐格式。

我的音乐都译码成我自定义的格式保存在`resource`目录下的各个`json`文件中。这里的格式与第1题稍有不同，具体为：

~~~json
{
    "song": [
        [3, 5, 0.5],
        // ...
    ]
}
~~~

`json`文件中包含一个键值对，键为`song`，值为一个二维数组。每维上有3个数，前两个代表原本的音符对应于频率矩阵的索引，最后一个数代表持续的节拍数。频率矩阵相比第一题，多了基频为110Hz的波段，用如下代码生成：

~~~matlab
base = [110, 220, 440, 880]';
power = linspace(0, 1 - 1/12, 12);
rate = 2.^power;
tunes = base * rate;
~~~

然后使用`JSONLab`工具包中的`loadjson`函数读取`json`文件即可读出音乐曲谱。

我将获取音乐旋律的操作封装为一个函数`get_melody`，保存在`get_melody.m`文件中，在本题中直接调用该函数获取音乐旋律，送到matlab中播放。

~~~matlab
melody = get_melody(tunes, tunes_harmonic, fs, song, beat);
sound(melody, fs);
~~~

其中`tunes_harmonic`为每个音调的基波与谐波幅度比，我这里只使用了二次谐波，其幅度为基波的0.2倍，用如下代码生成该矩阵

~~~matlab
tunes_size = size(tunes);
tunes_harmonic = zeros([tunes_size, 2]);
for i = 1: 1: tunes_size(1)
    for j = 1: 1: tunes_size(2)
        tunes_harmonic(i, j, :) = [1, 0.2];
    end
end
~~~

本题代码位于`hw1_2_1_5.m`文件中。

### 1.2.2 用傅里叶级数分析音乐

#### 6 7 预处理

我首先在`hw1_2_2_6.m`文件中，找到导入`Guitar.MAT`文件，然后将`realwave`和`wave2proc`的波形`plot`出来观察，发现`wave2proc`相比`realwave`，噪声更少，更加整齐。同时我统计出这段音频里有10个周期的波形。

在思考过后，我认为要将`realwave`转换成`wave2proc`，可以通过重复多次`realwave`再取平均的方法，降低非线性谐波与噪声的影响，从而达到预处理的目的。

在`hw1_2_2_7.m`中，我实现了这一降噪的方法。具体分析与执行步骤如下：

由于原波形有十个周期，我希望通过平均十个周期的波形，完成降噪的操作。注意到原本的采样点并不是10的倍数，没法直接进行平均，因此我首先进行重采样，提高10倍的采样率，强行让采样点为10的倍数。

~~~matlab
realwave_10 = resample(realwave, 10, 1);
~~~

此时我可以认为，`realwave_10`的每`length(realwave_10) / 10`个点，构成波形的一个周期。接下来就是对十个周期的波形取平均。代码如下

~~~matlab
len = length(realwave);
realwave_10 = resample(realwave, 10, 1);
period = zeros(len, 1);

for i = 1: 1: len
    for j = 0: 1: 9
        period(i) = period(i) + realwave_10(j * len + i);
    end
    period(i) = period(i) / 10;
end
~~~

此时就得到了一个周期内的良好的波形`period`。

接下来再还原成十个周期，并重采样为原来的243个点。

~~~matlab
period_10 = repmat(period, 10, 1);
w2p = resample(period_10, 1, 10);
~~~

然后可以看一看我这种方法处理后的结果：

![hw1_2_2_7](img/hw1_2_2_7.png)

结果与材料中给定`wave2proc`非常相似，处理结果上也成功完成了降噪。

#### 8 应用傅里叶变换
