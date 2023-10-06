import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry
@Component
struct Grids {
  @State title: string = '栅格布局 Grid';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  @State numberData: Array<number> = [ 1, 2, 3];  // 栅格数据

  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]; // 颜色数据


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
      // Grid 栅格（行列分割）
      Text('Grid 栅格（行列分割）')
        .fontSize(14)
        .margin({ top:20, bottom: 12})

      Grid() {
        ForEach(this.numberData, (item: number) => {
          ForEach(this.numberData, (subItem: number) => {
            GridItem() {
              Text(subItem.toString())
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(60)
                .backgroundColor(0xF5DEB3)
            }
          }, (subItem: number, subIndex: number) => {
            return `${subItem}_${subIndex}`
          })
        }, (item: number, index: number) => {
          return `${item}_${index}`
        })
      }
      .width(200)
      .height(200)
      .backgroundColor('#F5F5F5')
      .columnsTemplate('1fr 1fr 1fr') // 3列，超过不显示
      .columnsGap(10) // 每列间隔10
      .rowsTemplate('1fr 1fr 1fr')  // 3行，超过不显示
      .rowsGap(10)  // 每行间隔10

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // GridRow 栅格（行）
      Text('GridRow 栅格（行）')
        .fontSize(14)
        .margin({ bottom: 12})

      GridRow({ columns: 4 }) {
        ForEach(this.bgColors, (item: Color, index: number) => {
          GridCol() {
            Row() {
              Text(`${index + 1}`).fontSize(14)
            }.width('100%').height(50)
          }.backgroundColor(item)
        }, (item: number, index: number) => {
          return `${item}_${index}`
        })
      }
      .width('100%')

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // GridCol（GridRow的子栅格）
      Text('GridCol（GridRow的子栅格）')
        .fontSize(14)
        .margin({ bottom: 12})

      GridRow({
        columns: 12,  // 设置每行有多少个栅格，默认为12
        breakpoints: {
          value: ['200vp', '300vp', '400vp', '500vp', '600vp'],
          reference: BreakpointsReference.WindowSize
        }
      }) {
        ForEach(this.bgColors, (item: Color, index: number) => {
          GridCol({
            // span为每个屏幕尺寸对应的栅格比例，
            // 默认每行为12格，当数值为2时，一行显示 12/2 = 6 列，以此类推
            span: {
              xs: 2,
              sm: 2,
              md: 2,
              lg: 4,
              xl: 4,
              xxl: 4
            }
          }) {
            Row() {
              Text(`${index + 1}`).fontSize(14)
            }.width("100%").height(50)
          }.backgroundColor(item)
        })
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