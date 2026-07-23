@修改说明：按键2功能已从显示相位旋转角度改为显示电池电压
@电池电压采集：PA6 ADC通道
@分压电阻：10k（上）/ 240k（下）
@参考电压：3.3V
@计算公式：实际电压 = (ADC_VALUE / 4095) * 3.3 * (10k + 240k) / 240k
@         = (ADC_VALUE / 4095) * 3.3 * 250 / 240
@         = ADC_VALUE * 3.3 * 250 / (4095 * 240)
@         = ADC_VALUE * 0.003357

@修改的代码段：

__anjian2:
__xianshi_dianyuan:
	@读取PA6 ADC值显示电池电压
	ldr r0, = 0x40012440  @ ADC数据寄存器
	ldr r1, [r0]          @ 读取ADC值 (0-4095)
	
	@计算实际电压 = ADC_VALUE * 3.3 * 250 / (4095 * 240)
	@简化: = ADC_VALUE * 825 / (4095 * 240) * 1000 (单位mV)
	@    = ADC_VALUE * 825 / 983400 * 1000
	@    = ADC_VALUE * 3.357
	
	ldr r2, = 3357        @ 乘以系数 3357 (表示3.357)
	muls r1, r1, r2       @ r1 = ADC_VALUE * 3357
	ldr r2, = 1000000     @ 除以100万得到实际电压
	udiv r1, r1, r2       @ r1 = (ADC_VALUE * 3357) / 1000000
	
	@显示电压值
	ldr r2, = dianyuan_xianshi
	str r1, [r2]
	
	@转换为数码管显示
	movs r1, # 2          @ 显示3位数字
	bl _zhuanshumaguanma
	bl _xieshumaguan
	b __ren_wu_diao_du

@说明：上述为主逻辑框架
@实际实现需要：
@1. 确保PA6已配置为ADC输入（模拟模式）
@2. ADC已初始化并连接到通道（当前代码中已初始化）
@3. 修改ADC通道选择为PA6对应的通道
