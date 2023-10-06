import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏


@Entry  // 页面入口（装饰器）
@Component  // 组件（装饰器）
struct Picker {
  @State title: string = '选择器 Picker';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  private selectedDate: Date = new Date();  // 日期选择

  private selectedTime: Date = new Date('2022-07-22T08:00:00');  // 时间选择

  private select: number = 1;
  private fruits: string[] = ['apple', 'orange', 'banana', 'grape', 'pineapple', 'strawberry']

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
      // TextPicker
      Text('TextPicker 文本选择')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      TextPicker({ range: this.fruits, selected: this.select })
        .onChange((value: string, index: number) => {
          this.select = index;
        })
        .defaultPickerItemHeight(40)  // 默认行高

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // DatePicker
      Text('DatePicker 日期选择')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      DatePicker({
        start: new Date('2000-1-1'),
        end: new Date('2030-1-1'),
        selected: this.selectedDate
      })
        .onChange((value: DatePickerResult) => {
          this.selectedDate.setFullYear(value.year, value.month, value.day)
        })

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // TimePicker
      Text('DatePicker 时间选择')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      TimePicker({
        selected: this.selectedTime,
      })
        .useMilitaryTime(true) // 是否为24小时制
        .onChange((value: TimePickerResult) => {
          this.selectedTime.setHours(value.hour, value.minute)
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

