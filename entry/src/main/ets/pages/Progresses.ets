import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry  // 页面入口（装饰器）
@Component  // 组件（装饰器）
struct Progresses {
  @State title: string = '进度条 Progress & Slider';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  /**
   *  slider滑动组件value
   */
  @State sliderValue1: number = 10;
  @State sliderValue2: number = 20;
  @State sliderValue3: number = 10;
  @State sliderValue4: number = 20;

  /**
   * 生命周期函数，创建组件实例后，执行build渲染函数之前
   */
  aboutToAppear() {}

  /**
   * 自定义样式：page
   */
  @Styles pageStyle() {
    .width('100%')
    .padding({
      top: Constants.PAGE_HEADER_HEIGHT,
      left: Constants.PAGE_PADDING_LEFT,
      right: Constants.PAGE_PADDING_RIGHT,
      bottom: Constants.PAGE_PADDING_BOTTOM,
    })
  }

  /**
   * 自定义样式：divider
   */
  @Styles dividerStyle() {
    .width('100%')
    .margin({ top: 24, bottom: 24})
  }

  /**
   * 内容展示（自定义builder渲染）
   */
  @Builder bodyBuilder() {
    Column(){
      // 默认进度条
      Text('Progress linear 线形')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      Progress({ value: 20, total: 100, type: ProgressType.Linear })
        .width(200)
        .margin({ top: 10 })
        .style({
          strokeWidth: 4, // 进度条宽度
        })
      Progress({ value: 40, total: 100, type: ProgressType.Linear })
        .width(200)
        .margin({ top: 10 })
        .style({
          strokeWidth: 8, // 进度条宽度
        })
        .color('#07c160') // 进度条颜色

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Progress Ring
      Text('Progress Ring 圆形')
        .fontSize(14)
        .margin({ bottom: 12})
      Row() {
        Progress({ value: 20, total: 100, type: ProgressType.Ring })
          .width(80)
          .height(80)
          .style({
            strokeWidth: 4, // 进度条宽度
          })
          .margin({right: 20})
        Progress({ value: 40, total: 100, type: ProgressType.Ring })
          .width(80)
          .height(80)
          .style({
            strokeWidth: 8, // 进度条宽度
          })
          .color('#07c160') // 进度条颜色
      }

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Progress ScaleRing
      Text('Progress ScaleRing 环形')
        .fontSize(14)
        .margin({ bottom: 12})
      Row() {
        Progress({ value: 20, total: 100, type: ProgressType.ScaleRing  })
          .width(80)
          .height(80)
          .style({
            strokeWidth: 8, // 进度条宽度
            scaleCount: 20, // 环形刻度的个数
            scaleWidth: 4,  // 每个刻度的宽度
          })
          .margin({right: 20})
          .backgroundColor('#9E9E9E') // 修改背景色
        Progress({ value: 40, total: 100, type: ProgressType.ScaleRing  })
          .width(80)
          .height(80)
          .style({
            strokeWidth: 16, // 进度条宽度
            scaleCount: 20, // 环形刻度的个数
            scaleWidth: 2,  // 每个刻度的宽度
          })
          .color('#07c160') // 进度条颜色
          .backgroundColor('#9E9E9E') // 修改背景色
      }

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Progress Eclipse
      Text('Progress Eclipse 圆胶囊')
        .fontSize(14)
        .margin({ bottom: 12})
      Row() {
        Progress({ value: 20, total: 100, type: ProgressType.Eclipse  })
          .width(80)
          .height(80)
          .style({
            strokeWidth: 8, // 进度条宽度
          })
          .margin({right: 20})
        Progress({ value: 40, total: 100, type: ProgressType.Eclipse  })
          .width(80)
          .height(80)
          .style({
            strokeWidth: 16, // 进度条宽度
          })
          .color('#07c160') // 进度条颜色
      }

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Progress Capsule 胶囊
      Text('Progress Capsule 胶囊')
        .fontSize(14)
        .margin({ bottom: 12})
      Row() {
        Progress({ value: 20, total: 100, type: ProgressType.Capsule  })
          .width(50)
          .height(100)
          .style({
            strokeWidth: 8, // 进度条宽度
          })
          .margin({right: 20})
        Progress({ value: 40, total: 100, type: ProgressType.Capsule  })
          .width(100)
          .height(50)
          .style({
            strokeWidth: 16, // 进度条宽度
          })
          .color('#07c160') // 进度条颜色
      }

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Slider OutSet
      Text('Slider OutSet 滑块')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ alignItems: ItemAlign.Center}) {
        Slider({
          value: this.sliderValue1, // 当前值
          min: 0, // 最小值，默认值0
          max: 100, // 最大值，默认值100
          step: 1,  // 滑动步长，即每一步的长度，默认值1
          style: SliderStyle.OutSet,  // 滑动样式，默认outset
        })
          .flexGrow(1)  // flex布局自适应
          .onChange((value: number) => {
            this.sliderValue1 = Math.floor(value)
          })
        Text(this.sliderValue1.toString())
          .fontSize(14)
          .width(30)
      }
      Flex({ alignItems: ItemAlign.Center}) {
        Slider({
          value: this.sliderValue2, // 当前值
          step: 10, // 滑动步长
        })
          .flexGrow(1)  // flex布局自适应
          .onChange((value: number) => {
            this.sliderValue2 = Math.floor(value)
          })
          .blockColor('#fa9d3b')
          .selectedColor('#07c160')
          .showTips(true) // 显示进度气泡
          .showSteps(true)  // 显示step刻度
          .trackThickness(4.5)  // 圆形滑块大小，默认为4
        Text(this.sliderValue2.toString())
          .fontSize(14)
          .width(30)
      }

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Slider InSet
      Text('Slider InSet 滑块')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ alignItems: ItemAlign.Center }) {
        Slider({
          value: this.sliderValue3, // 当前值
          style: SliderStyle.InSet,  // 滑动样式，默认outset
        })
          .flexGrow(1)  // flex布局自适应
          .onChange((value: number) => {
            this.sliderValue3 = Math.floor(value)
          })
        Text(this.sliderValue3.toString())
          .fontSize(14)
          .width(30)
      }
      Flex({ alignItems: ItemAlign.Center}) {
        Slider({
          value: this.sliderValue4, // 当前值
          style: SliderStyle.InSet,  // 滑动样式，默认outset
          step: 10, // 滑动步长
        })
          .flexGrow(1)  // flex布局自适应
          .onChange((value: number) => {
            this.sliderValue4 = Math.floor(value)
          })
          .blockColor('#fa9d3b')
          .selectedColor('#07c160')
          .showTips(true) // 显示进度气泡
          .showSteps(true)  // 显示step刻度
        Text(this.sliderValue4.toString())
          .fontSize(14)
          .width(30)
      }
    }
    .pageStyle()  //自定义样式：page
  }

  /**
   * 页面渲染 builder
   */
  build() {
    Column() {
      Stack({ alignContent: Alignment.Top }){
        // 自定义导航栏
        NavigationBar({ title: this.title })
        // 页面容器Navigation组件
        Scroll(this.scroller) {
          // 自定义builder渲染
          this.bodyBuilder()
        }
        .scrollBar(BarState.Off)
      }
    }
    .width('100%')
    .height('100%')
  }
}