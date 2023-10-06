import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry
@Component
struct Linear {
  @State title: string = '线性布局 Row & Column';  // 页面标题
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
   * 自定义样式：row
   */
  @Styles rowStyle() {
    .width('100%')
    .height(50)
    .border({ width: 1 })
    .margin({ bottom: 10 })
  }

  /**
   * 自定义样式：column
   */
  @Styles columnStyle() {
    .width(180)
    .height(120)
    .border({ width: 1 })
    .margin({ bottom: 10 })
  }

  /**
   * 内容展示（自定义builder渲染）
   */
  @Builder bodyBuilder() {
    Column(){
      // Row 行组件
      Text('Row 行组件')
        .fontSize(14)
        .margin({ top:20, bottom: 12})

      // 横向居中 alignItems(Center)，间距为10
      Text('横向居中 alignItems(Center)，间距为10').fontSize(14).width('100%')
      Row({ space: 10}) {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
      }
      .rowStyle()

      // 横向顶部对齐 alignItems(Top)
      Text('横向顶部对齐 alignItems(Top)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
      }
      .rowStyle()
      .alignItems(VerticalAlign.Top)

      // 横向底部对齐，alignItems(Bottom)
      Text('横向底部对齐 alignItems(Bottom)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
      }
      .rowStyle()
      .alignItems(VerticalAlign.Bottom)

      // 纵向居中 justifyContent(Center)
      Text('纵向居中 justifyContent(Center)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
      }
      .rowStyle()
      .height(50)
      .justifyContent(FlexAlign.Center)

      // 纵向居左 justifyContent(Start)
      Text('纵向居左 justifyContent(Start)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
      }
      .rowStyle()
      .height(30)
      .justifyContent(FlexAlign.Start)

      // 纵向居右 justifyContent(End)
      Text('纵向居右 justifyContent(End)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
      }
      .rowStyle()
      .height(30)
      .justifyContent(FlexAlign.End)

      // 纵向两侧对齐 justifyContent(SpaceBetween)
      Text('纵向两侧对齐 justifyContent(SpaceBetween)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
      }
      .rowStyle()
      .height(30)
      .justifyContent(FlexAlign.SpaceBetween)

      // 纵向两侧对齐 justifyContent(SpaceAround)
      Text('纵向两侧对齐 justifyContent(SpaceAround)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
      }
      .rowStyle()
      .height(30)
      .justifyContent(FlexAlign.SpaceAround)

      // 纵向两侧对齐 justifyContent(SpaceEvenly)
      Text('纵向两侧对齐 justifyContent(SpaceEvenly)').fontSize(14).width('100%')
      Row() {
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
        Row().width('25%').height(30).backgroundColor(0x00FFFF)
        Row().width('25%').height(30).backgroundColor(0xAFEEEE)
      }
      .rowStyle()
      .height(30)
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 0 })

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Column 行组件
      Text('Column 列组件')
        .fontSize(14)
        .margin({ bottom: 12})

      // 纵向居中 HorizontalAlign(Center)，间距为10
      Text('纵向居中 HorizontalAlign(Center)，间距为10').fontSize(14).width('100%')
      Column({ space: 10 }) {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
      }
      .columnStyle()

      // 纵向居左 HorizontalAlign(Start)
      Text('纵向居左 HorizontalAlign(Start)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
      }
      .columnStyle()
      .alignItems(HorizontalAlign.Start)

      // 纵向居右 HorizontalAlign(End)
      Text('纵向居右 HorizontalAlign(End)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height('25%').backgroundColor(0xF5DEB3)
        Column().width(60).height('25%').backgroundColor(0xD2B48C)
      }
      .columnStyle()
      .alignItems(HorizontalAlign.End)

      // 横向居中 justifyContent(Center)
      Text('横向居中 justifyContent(Center)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
      }
      .columnStyle()
      .width(60)
      .justifyContent(FlexAlign.Center)

      // 横向居左 justifyContent(Start)
      Text('横向居左 justifyContent(Start)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
      }
      .columnStyle()
      .width(60)
      .justifyContent(FlexAlign.Start)

      // 横向居右 justifyContent(End)
      Text('横向居右 justifyContent(End)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
      }
      .columnStyle()
      .width(60)
      .justifyContent(FlexAlign.End)

      // 横向两侧对齐 justifyContent(SpaceBetween)
      Text('横向两侧对齐 justifyContent(SpaceBetween)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
      }
      .columnStyle()
      .width(60)
      .justifyContent(FlexAlign.SpaceBetween)

      // 横向两侧对齐 justifyContent(SpaceAround)
      Text('横向两侧对齐 justifyContent(SpaceAround)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
      }
      .columnStyle()
      .width(60)
      .justifyContent(FlexAlign.SpaceAround)

      // 横向两侧对齐 justifyContent(SpaceEvenly)
      Text('横向两侧对齐 justifyContent(SpaceEvenly)').fontSize(14).width('100%')
      Column() {
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
        Column().width(60).height(25).backgroundColor(0xD2B48C)
        Column().width(60).height(25).backgroundColor(0xF5DEB3)
      }
      .columnStyle()
      .width(60)
      .justifyContent(FlexAlign.SpaceEvenly)
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