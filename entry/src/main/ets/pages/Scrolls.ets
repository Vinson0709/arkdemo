import hilog from '@ohos.hilog';
import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

const TAG = 'page.scrolls'

@Entry
@Component
struct Scrolls {
  @State title: string = '滚动容器 Scroll';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  @State numberData: Array<number> = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];  // 栅格数据

  private bodyScroller: Scroller = new Scroller();  // body中的滚动条

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
      // 绑定事件
      Text('绑定事件')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      Scroll(this.bodyScroller) {
        Column() {
          ForEach(this.numberData, (item: number, index: number) => {
            Text(item.toString())
              .width('90%')
              .height(100)
              .backgroundColor(0xF5DEB3)
              .margin({ bottom: 20, top: index === 0 ? 20 : 0 })
          }, (item: number, index: number) => {
            return `${item}_${index}`;
          })
        }
      }
      .width('100%')
      .height('80%')
      .backgroundColor('#F5F5F5')
      .scrollable(ScrollDirection.Vertical) // 纵向滚动
      .scrollBar(BarState.On) // 是否显示滚动条
      .scrollBarColor('#999999')
      .scrollBarWidth(6)
      .edgeEffect(EdgeEffect.Spring)  // 滚动至边缘的特效
      // 滚动到边缘
      .onScrollEdge(() => {
        hilog.info(0x0000, TAG, 'Scroll Edge')
      })
      // 滚动开始
      .onScrollStart(() => {
        hilog.info(0x0000, TAG, 'Scroll Start')
      })
      // 滚动结束
      .onScrollStop(() => {
        hilog.info(0x0000, TAG, 'Scroll Stop')
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