# [Using the Linux Top Command](https://www.lifewire.com/linux-top-command-2201163)

## Introduction

linux环境下，`top`命令是被用来展示运行中的进程信息的。这个教程将会告诉你`top`命令的选项用法跟`top`命令展示的信息。

## How To Run The Top Command

在linux终端下输入命令`top`

## What Information Is Show

下面的信息是当你在Linux终端下运行`top`命令时显示出来的

### Line1

*	The time(系统当前时间)

*	How long the computer has been running(电脑运行的总时间)

*	Number of users(用户的数量)

*	Load average(系统加载的平均时间)

The Load average shows the system load time for the last 1, 5 and 15 minutes.

### Line2

*	Total number of tasks(任务的总数量)

*	Number of running tasks(运行中的任务数量)

*	Number of sleeping tasks(休眠中的任务数量)

*	Number of stopped tasks(暂停的任务数量)

*	Number of zombie tasks(僵尸进程的数量)

### Line3

*	CPU usage as a percentage by the user( CPU 消耗在 User Space 的时间百分比)

*	CPU usage as a percentage by the system( CPU 消耗在 Kernel Space 的时间百分比)

*	CPU usage as a percentage by low priority processes( CPU 消耗在低优先级进程的时间百分比)

*	CPU usage as a percentage by idle processes( CPU 消耗在闲置进程的时间百分比，这个值越低，说明 CPU 越忙)

*	CPU usage as a percentage by io wait( CPU 消耗在等待外部 I/O 的时间百分比，阻塞，这个值太高，说明外部设备有问题)

*	CPU usage as a percentage by hardware interrupts(CPU消耗在响应硬件中断请求的时间百分比)

*	CPU usage as a percentage by software interrupts( CPU 消耗在响应软件中断请求的时间百分比)

*	CPU usage as a percentage by steal time(该项指标只对虚拟机有效，表示分配给当前虚拟机的 CPU 时间之中，被同一台物理机上的其他虚拟机偷走的时间百分比)

### Line4

*	Total system memory(系统内存)

*	Free memory(空闲内存)

*	Memory used(使用内存)

*	Buffer cache(缓存)

### Line5

*	Total swap available(交换空间)

*	Total swap free(空闲交换空间)

*	Total swap used(使用的交换空间)

*	available memory(可用内存)

[This guide gives a description of swap partitions and whether you need them.](https://www.lifewire.com/do-you-need-swap-partition-2202049)

### Main Table

*	Process ID

*	User

*	Priority

*	Nice level

*	Virtual memory used by process

*	Resident memory used by a process

*	Shareable memory

*	CPU used by process as a percentage

*	Memory used by process as a percentage

*	Time process has been running

*	Command

[Here is a good guide discussing computer memory.](https://www.lifewire.com/pc-memory-speed-and-latency-832450)

### Key Switches For The Top Command

*	-h - Show the current version(显示当前`top`工具的版本)

*	-c - This toggles the command column between showing command and program name

*	-d - Specify the delay time between refreshing the screen(设置一个屏幕的刷新延迟时间(单位: s)，比如`top -d 5`)

*	-o - Sorts by the named field

*	-p - Only show processes with specified process IDs

*	-u - Show only processes by the specified user


### Summary

关于更多的参数选项和用法可以在终端下输入命令`man top`查看