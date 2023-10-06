import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry
@Component
struct Loading {
  @State title: string = '加载 Loading';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  /**
   * 生命周期函数，创建组件实例后，执行build渲染函数之前
   */
  aboutToAppear() {

  }

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
    Column({ space: 10 }) {
      // 自定义颜色
      Text('颜色自定义')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      LoadingProgress()
        .height(50)
      LoadingProgress()
        .height(50)
        .color(Color.Blue)
      LoadingProgress()
        .height(50)
        .color(Color.Green)
      LoadingProgress()
        .height(50)
        .color(Color.Red)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 大小自定义
      Text('大小自定义')
        .fontSize(14)
        .margin({ bottom: 12})

      LoadingProgress()
        .height(50)
        .color(Color.Blue)
      LoadingProgress()
        .height(75)
        .color(Color.Blue)
      LoadingProgress()
        .height(100)
        .color(Color.Blue)
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