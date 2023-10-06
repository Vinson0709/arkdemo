import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry
@Component
struct Stacks {
  @State title: string = '层叠布局 Stack';  // 页面标题
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
   * 自定义样式：stack
   */
  @Styles stackStyle(){
    .width('100%')
    .height(100)
    .backgroundColor(('#CCCCCC'))
  }

  /**
   * 内容展示（自定义builder渲染）
   */
  @Builder bodyBuilder() {
    Column(){
      // 左上 alignContent(TopStart)
      Text('左上 alignContent(TopStart)')
        .fontSize(14)
        .margin({ top:20, bottom: 12})

      Stack({ alignContent: Alignment.TopStart }){
        Text('Stack').fontSize(14).width('100%').textAlign(TextAlign.End)
        Column() {
          Text('子元素3').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3)

        Column() {
          Text('子元素2').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2)

        Column() {
          Text('子元素1').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 中上 alignContent(Top)
      Text('中上 alignContent(Top)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.Top }){
        Text('Stack').fontSize(14).width('100%').textAlign(TextAlign.End).margin({ top: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3).justifyContent(FlexAlign.End)

        Column() {
          Text('子元素2').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2).justifyContent(FlexAlign.End)

        Column() {
          Text('子元素1').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1).justifyContent(FlexAlign.End)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 右上 alignContent(TopEnd)
      Text('右上 alignContent(TopEnd)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.TopEnd }){
        Text('Stack').fontSize(14).width('100%').margin({ top: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%')
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3).justifyContent(FlexAlign.End)

        Column() {
          Text('子元素2').fontSize(14).width('100%')
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2).justifyContent(FlexAlign.End)

        Column() {
          Text('子元素1').fontSize(14).width('100%')
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1).justifyContent(FlexAlign.End)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 左侧 alignContent(Start)
      Text('左侧 alignContent(Start)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.Start }){
        Text('Stack').fontSize(14).width('100%').textAlign(TextAlign.End).margin({ bottom: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3)

        Column() {
          Text('子元素2').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2)

        Column() {
          Text('子元素1').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 居中 alignContent(Center)
      Text('居中 alignContent(Center)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.Center }){
        Text('Stack').fontSize(14).width('100%').textAlign(TextAlign.End).margin({ bottom: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3)

        Column() {
          Text('子元素2').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2)

        Column() {
          Text('子元素1').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 右侧 alignContent(End)
      Text('右侧 alignContent(End)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.End }){
        Text('Stack').fontSize(14).width('100%').margin({ bottom: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%')
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3)

        Column() {
          Text('子元素2').fontSize(14).width('100%')
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2)

        Column() {
          Text('子元素1').fontSize(14).width('100%')
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 左下 alignContent(BottomStart)
      Text('左下 alignContent(BottomStart)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.BottomStart }){
        Text('Stack').fontSize(14).width('100%').textAlign(TextAlign.End).margin({ bottom: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3)

        Column() {
          Text('子元素2').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2)

        Column() {
          Text('子元素1').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 中下 alignContent(Bottom)
      Text('中下 alignContent(Bottom)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.Bottom }){
        Text('Stack').fontSize(14).width('100%').textAlign(TextAlign.End).margin({ bottom: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3)

        Column() {
          Text('子元素2').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2)

        Column() {
          Text('子元素1').fontSize(14).width('100%').textAlign(TextAlign.End)
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1)
      }
      .stackStyle()

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 右下 alignContent(BottomEnd)
      Text('右下 alignContent(BottomEnd)')
        .fontSize(14)
        .margin({ bottom: 12})

      Stack({ alignContent: Alignment.BottomEnd }){
        Text('Stack').fontSize(14).width('100%').margin({ bottom: 80})
        Column() {
          Text('子元素3').fontSize(14).width('100%')
        }.width('40%').height(40).backgroundColor('#FFD700').zIndex(3)

        Column() {
          Text('子元素2').fontSize(14).width('100%')
        }.width('60%').height(60).backgroundColor('#7CFC00').zIndex(2)

        Column() {
          Text('子元素1').fontSize(14).width('100%')
        }.width('80%').height(80).backgroundColor('#40E0D0').zIndex(1)
      }
      .stackStyle()
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