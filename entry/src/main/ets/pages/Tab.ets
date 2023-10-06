import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

/**
 * 颜色item
 */
interface ColorItem {
  name: string,
  color: string,
}

@Entry
@Component
struct Tab {
  @State title: string = '页签容器 Tabs';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  @State fontColor: string = '#182431'; // 字体颜色
  @State selectedFontColor: string = '#007DFF'; // 选中时的字体颜色

  /**
   * 颜色数据
   */
  @State colorData: Array<ColorItem> = [
    { name: 'green', color: '#00CB87'},
    { name: 'blue', color: '#007DFF'},
    { name: 'yellow', color: '#FFBF00'},
    { name: 'pink', color: '#E67C92'},
  ];

  @State topCurrent: number = 0; // 顶部tab颜色的索引
  private topController: TabsController = new TabsController() // 顶部tab控制器

  @State bottomCurrent: number = 0; // 底部Tab颜色的索引
  private bottomController: TabsController = new TabsController() // 底部tab控制器

  @State leftCurrent: number = 0; // 左侧tab颜色的索引
  private leftController: TabsController = new TabsController() // 左侧tab控制器

  @State rightCurrent: number = 0; // 右侧Tab颜色的索引
  private rightController: TabsController = new TabsController() // 右侧tab控制器

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
   * 自定义 topTabBuilder
   * @param index
   * @param name
   */
  @Builder topTabBuilder(index: number, item: ColorItem) {
    Column() {
      Text(item.name)
        .fontColor(this.topCurrent === index ? item.color : this.fontColor)
        .fontSize(16)
        .fontWeight(this.topCurrent === index ? FontWeight.Bold : FontWeight.Normal)
        .lineHeight(22)
    }.width('100%')
  }

  /**
   * 自定义 bottomTabBuilder
   * @param index
   * @param name
   */
  @Builder bottomTabBuilder(index: number, item: ColorItem) {
    Column() {
      Text(item.name)
        .fontColor(this.bottomCurrent === index ? item.color : this.fontColor)
        .fontSize(16)
        .fontWeight(this.bottomCurrent === index ? FontWeight.Bold : FontWeight.Normal)
        .lineHeight(22)
    }.width('100%')
  }

  /**
   * 自定义 leftTabBuilder
   * @param index
   * @param name
   */
  @Builder leftTabBuilder(index: number, item: ColorItem) {
    Column() {
      Text(item.name)
        .fontColor(this.leftCurrent === index ? item.color : this.fontColor)
        .fontSize(16)
        .fontWeight(this.leftCurrent === index ? FontWeight.Bold : FontWeight.Normal)
        .lineHeight(22)
    }.width('100%')
  }

  /**
   * 自定义 rightTabBuilder
   * @param index
   * @param name
   */
  @Builder rightTabBuilder(index: number, item: ColorItem) {
    Column() {
      Text(item.name)
        .fontColor(this.rightCurrent === index ? item.color : this.fontColor)
        .fontSize(16)
        .fontWeight(this.rightCurrent === index ? FontWeight.Bold : FontWeight.Normal)
        .lineHeight(22)
    }.width('100%')
  }

  /**
   * 内容展示（自定义builder渲染）
   */
  @Builder bodyBuilder() {
    Column(){
      // 顶部 TabBar
      Text('顶部 TabBar')
        .fontSize(14)
        .margin({ top:20})
      Row() {
        Tabs({ barPosition: BarPosition.Start, controller: this.topController }){
          ForEach(this.colorData, (item: ColorItem, index: number) => {
            TabContent(){
              Column().width('100%').height('100%').backgroundColor(item.color)
            }.tabBar(this.topTabBuilder(index, item))
          }, (item: Color, index: number) => {
            return `content_${index}`;
          })
        }
        .vertical(false)  // 横向Tabs
        .barMode(BarMode.Fixed) // TabBar布局
        .barHeight(60)  // TabBar高度
        .animationDuration(300) // 切换时长
        // change事件
        .onChange((index: number) => {
          this.topCurrent = index;
        })
      }.width('100%').height(200)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 底部 TabBar
      Text('底部 TabBar')
        .fontSize(14)
        .margin({ bottom: 10 })
      Row() {
        Tabs({ barPosition: BarPosition.End, controller: this.bottomController }){
          ForEach(this.colorData, (item: ColorItem, index: number) => {
            TabContent(){
              Column().width('100%').height('100%').backgroundColor(item.color)
            }.tabBar(this.bottomTabBuilder(index, item))
          }, (item: Color, index: number) => {
            return `content_${index}`;
          })
        }
        .vertical(false)  // 横向Tabs
        .barMode(BarMode.Fixed) // TabBar布局
        .barHeight(60)  // TabBar高度
        .animationDuration(300) // 切换时长
        // change事件
        .onChange((index: number) => {
          this.bottomCurrent = index;
        })
      }.width('100%').height(200)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 左侧 TabBar
      Text('左侧 TabBar')
        .fontSize(14)
        .margin({ bottom: 10 })
      Row() {
        Tabs({ barPosition: BarPosition.Start, controller: this.leftController }){
          ForEach(this.colorData, (item: ColorItem, index: number) => {
            TabContent(){
              Column().width('100%').height('100%').backgroundColor(item.color)
            }.tabBar(this.leftTabBuilder(index, item))
          }, (item: Color, index: number) => {
            return `content_${index}`;
          })
        }
        .vertical(true)  // 横向Tabs
        .barMode(BarMode.Fixed) // TabBar布局
        .barWidth(60)  // TabBar宽度
        .animationDuration(300) // 切换时长
        // change事件
        .onChange((index: number) => {
          this.leftCurrent = index;
        })
      }.width('100%').height(200)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // 右侧 TabBar
      Text('右侧 TabBar')
        .fontSize(14)
        .margin({ bottom: 10 })
      Row() {
        Tabs({ barPosition: BarPosition.End, controller: this.rightController }){
          ForEach(this.colorData, (item: ColorItem, index: number) => {
            TabContent(){
              Column().width('100%').height('100%').backgroundColor(item.color)
            }.tabBar(this.rightTabBuilder(index, item))
          }, (item: Color, index: number) => {
            return `content_${index}`;
          })
        }
        .vertical(true)  // 横向Tabs
        .barMode(BarMode.Fixed) // TabBar布局
        .barWidth(60)  // TabBar宽度
        .animationDuration(300) // 切换时长
        // change事件
        .onChange((index: number) => {
          this.rightCurrent = index;
        })
      }.width('100%').height(200)
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