import promptAction from '@ohos.promptAction';
import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏


@Entry  // 页面入口（装饰器）
@Component  // 组件（装饰器）
struct Buttons {
  @State title: string = '按钮 Button';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

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
   * 自定义样式：button
   */
  @Styles buttonStyle(){
    .width(180)
    .height(40)
    .margin({ bottom: 10})
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
      // Button 类型
      Text('Button 类型')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      // 普通按钮 Normal
      Button('普通按钮 Normal', { type: ButtonType.Normal})
        .fontSize(14)
        .buttonStyle()
      // Capsule
      Button('胶囊按钮 Capsule', { type: ButtonType.Capsule})
        .fontSize(14)
        .buttonStyle()
      // Circle
      Button({ type: ButtonType.Circle}) {
        Column() {
          Text('圆形按钮')
            .fontSize(14)
            .fontColor(Color.White)
            .margin({ bottom: 2 })
          Text('Circle')
            .fontSize(14)
            .fontColor(Color.White)
        }
      }
      .width(80)
      .height(80)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 带icon的按钮
      Text('带icon的按钮')
        .fontSize(14)
        .margin({ bottom: 12})
      // Normal类型按钮，去除点击效果
      Button({ type: ButtonType.Capsule }) {
        Row() {
          Image($r('app.media.setting'))
            .width(20)
          Text('+ 文字')
            .fontSize(14)
            .fontColor('#FFFFFF')
            .margin({ left: 4 })
        }
      }
      .buttonStyle()
      // Circle
      Button({ type: ButtonType.Circle }) {
        Image($r('app.media.setting'))
          .width(20)
      }
      .fontSize(14)
      .width(40)
      .height(40)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 自定义按钮效果
      Text('自定义按钮效果')
        .fontSize(14)
        .margin({ bottom: 12})
      // 普通按钮 Normal
      Button('普通按钮 + 圆角', { type: ButtonType.Normal})
        .fontSize(14)
        .buttonStyle()
        .borderRadius(8)
      // Disable 关闭点击效果
      Button('Disable 关闭点击效果', { type: ButtonType.Capsule, stateEffect: false})
        .fontSize(14)
        .buttonStyle()
        .opacity(0.6)
      Button('改变背景颜色', { type: ButtonType.Capsule})
        .fontSize(14)
        .buttonStyle()
        .backgroundColor('#07c160')  //背景色
      Button('字体颜色 + 背景 + 边框', { type: ButtonType.Capsule})
        .fontSize(14)
        .buttonStyle()
        .fontColor(Color.Red)
        .backgroundColor(Color.Pink)
        .borderWidth(1)
        .borderColor(Color.Red)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 添加点击事件
      Text('添加点击事件')
        .fontSize(14)
        .margin({ bottom: 12})
      Button('点我', { type: ButtonType.Capsule})
        .fontSize(14)
        .buttonStyle()
        .onClick((event: ClickEvent) => {
          promptAction.showToast({
            message: '你点我是吧!!',
            duration: 2000,
          })
        })
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