import hilog from '@ohos.hilog';
import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

const TAG = 'page.lists'

@Entry
@Component
struct Lists {
  @State title: string = '列表布局 List';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  @State numberData: Array<number> = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];  // 栅格数据

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
      // 纵向，单列
      Text('纵向，单列')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      // space间隔，initialIndex初始索引值
      List({ space: 10, initialIndex: 0}){
        ForEach(this.numberData, (item: number) => {
          ListItem() {
            Text(item.toString())
              .fontSize(14)
              .width('100%')
              .height(30)
              .backgroundColor(0xF5DEB3)
          }
        })
      }.width('100%').height(170)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 纵向，多列
      Text('纵向，多列')
        .fontSize(14)
        .margin({ bottom: 12})
      List({ space: 10 }){
        ForEach(this.numberData, (item: number) => {
          ListItem() {
            Text(item.toString())
              .fontSize(14)
              .width('90%')
              .margin({ left: '5%'})
              .height(30)
              .backgroundColor(0xF5DEB3)
          }
        })
      }.lanes(2).width('100%').height(170)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 横向，单列
      Text('横向，单列')
        .fontSize(14)
        .margin({ bottom: 12})
      List({ space: 10 }){
        ForEach(this.numberData, (item: number) => {
          ListItem() {
            Text(item.toString())
              .fontSize(14)
              .width(50)
              .height(50)
              .backgroundColor(0xF5DEB3)
          }
        })
      }.listDirection(Axis.Horizontal).width('100%').height(50)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 横向，多列
      Text('横向，多列')
        .fontSize(14)
        .margin({ bottom: 12})
      List({ space: 10 }){
        ForEach(this.numberData, (item: number) => {
          ListItem() {
            Text(item.toString())
              .fontSize(14)
              .width(50)
              .height(50)
              .backgroundColor(0xF5DEB3)
          }
        })
      }.listDirection(Axis.Horizontal).lanes(2).width('100%').height(110)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 绑定事件
      Text('绑定事件')
        .fontSize(14)
        .margin({ bottom: 12})
      // space间隔，initialIndex初始索引值
      List({ space: 10, initialIndex: 0}){
        ForEach(this.numberData, (item: number) => {
          ListItem() {
            Text(item.toString())
              .fontSize(14)
              .width('100%')
              .height(30)
              .backgroundColor(0xF5DEB3)
          }
        })
      }
      .width('100%')
      .height(170)
      // 滚动到底部
      .onReachEnd(() => {
        hilog.info(0x0000, TAG, 'Reach End')
      })
      // 滚动到顶部
      .onReachStart(() => {
        hilog.info(0x0000, TAG, 'Reach Start')
      })
      // 滚动事件
      .onScrollIndex((start: number, end: number) => {
        hilog.info(0x0000, TAG, `start: ${start}, end: ${end}`)
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