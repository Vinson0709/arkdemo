import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry
@Component
struct Flexes {
  @State title: string = '弹性布局 Flex';  // 页面标题
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
    Column(){
      // 横向排列
      Text('横向排列 Row')
        .fontSize(14)
        .margin({ top:20, bottom: 12})

      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text('1').width('20%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('20%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('20%').height(30).backgroundColor(0xF5DEB3)
        Text('4').width('20%').height(30).backgroundColor(0xD2B48C)
      }
      .height(60)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 横向排列（逆向）
      Text('横向排列（逆向）RowReverse')
        .fontSize(14)
        .margin({ bottom: 12})

      Flex({ direction: FlexDirection.RowReverse, alignItems: ItemAlign.Center }) {
        Text('1').width('20%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('20%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('20%').height(30).backgroundColor(0xF5DEB3)
        Text('4').width('20%').height(30).backgroundColor(0xD2B48C)
      }
      .height(60)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 纵向排列
      Text('纵向排列 Column')
        .fontSize(14)
        .margin({ top:20, bottom: 12})

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('1').width('100%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('100%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('100%').height(30).backgroundColor(0xF5DEB3)
        Text('4').width('100%').height(30).backgroundColor(0xD2B48C)
      }
      .height(150)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 纵向排列（逆向）
      Text('纵向排列（逆向）ColumnReverse')
        .fontSize(14)
        .margin({ bottom: 12})

      Flex({ direction: FlexDirection.ColumnReverse, alignItems: ItemAlign.Center }) {
        Text('1').width('100%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('100%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('100%').height(30).backgroundColor(0xF5DEB3)
        Text('4').width('100%').height(30).backgroundColor(0xD2B48C)
      }
      .height(150)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 单行/多行排列 Wrap
      Text('单行/多行排列 Wrap')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
        Text('1').width('50%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('50%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('50%').height(30).backgroundColor(0xD2B48C)
      }
      .height(80)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 单行/多行排列 NoWrap
      Text('单行排列（不换行） NoWrap')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.NoWrap }) {
        Text('1').width('50%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('50%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('50%').height(30).backgroundColor(0xF5DEB3)
      }
      .height(80)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 单行/多行排列 NoWrap
      Text('单行/多行排列 （逆向）WrapReverse')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.WrapReverse }) {
        Text('1').width('50%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('50%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('50%').height(30).backgroundColor(0xD2B48C)
      }
      .height(80)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // alignItems对齐 Start 或 Auto
      Text('alignItems对齐 Start 或 Auto')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start }) {
        Text('1').width('25%').height(20).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(40).backgroundColor(0xF5DEB3)
        Text('4').width('25%').height(50).backgroundColor(0xD2B48C)
      }
      .height(60)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // alignItems对齐 Center 或 Baseline
      Text('alignItems对齐 Center 或 Baseline')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text('1').width('25%').height(20).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(40).backgroundColor(0xF5DEB3)
        Text('4').width('25%').height(50).backgroundColor(0xD2B48C)
      }
      .height(60)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // alignItems对齐 End
      Text('alignItems对齐 End')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.End }) {
        Text('1').width('25%').height(20).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(40).backgroundColor(0xF5DEB3)
        Text('4').width('25%').height(50).backgroundColor(0xD2B48C)
      }
      .height(60)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // alignItems对齐 Stretch
      Text('alignItems对齐 Stretch')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Stretch }) {
        Text('1').width('25%').height(20).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(40).backgroundColor(0xF5DEB3)
        Text('4').width('25%').height(50).backgroundColor(0xD2B48C)
      }
      .height(60)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // justifyContent对齐 Start
      Text('justifyContent对齐 Start')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Start}) {
        Text('1').width('25%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(30).backgroundColor(0xF5DEB3)
      }
      .height(30)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // justifyContent对齐 Center
      Text('justifyContent对齐 Center')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center}) {
        Text('1').width('25%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(30).backgroundColor(0xF5DEB3)
      }
      .height(30)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // justifyContent对齐 End
      Text('justifyContent对齐 End')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.End}) {
        Text('1').width('25%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(30).backgroundColor(0xF5DEB3)
      }
      .height(30)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // justifyContent对齐 SpaceBetween
      Text('justifyContent对齐 SpaceBetween')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween}) {
        Text('1').width('25%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(30).backgroundColor(0xF5DEB3)
      }
      .height(30)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // justifyContent对齐 SpaceAround
      Text('justifyContent对齐 SpaceAround')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround}) {
        Text('1').width('25%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(30).backgroundColor(0xF5DEB3)
      }
      .height(30)
      .width('100%')
      .backgroundColor(0xAFEEEE)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // justifyContent对齐 SpaceEvenly
      Text('justifyContent对齐 SpaceEvenly')
        .fontSize(14)
        .margin({ bottom: 12})
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceEvenly}) {
        Text('1').width('25%').height(30).backgroundColor(0xF5DEB3)
        Text('2').width('25%').height(30).backgroundColor(0xD2B48C)
        Text('3').width('25%').height(30).backgroundColor(0xF5DEB3)
      }
      .height(30)
      .width('100%')
      .backgroundColor(0xAFEEEE)
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