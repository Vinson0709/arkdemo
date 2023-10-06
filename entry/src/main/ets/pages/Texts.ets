import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry  // 页面入口（装饰器）
@Component  // 组件（装饰器）
struct Texts {
  @State title: string = '文本 Text & TextInput & ...';  // 页面标题
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
   * 自定义样式：text
   */
  @Styles textStyle(){
    .width(260)
    .height(30)
    .borderWidth(1)
    .borderColor(Color.Black)
    .margin({ bottom: 10 })
  }

  /**
   * 自定义样式：input
   */
  @Styles inputStyle() {
    .width(260)
    .height(40)
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
      // Text 文本
      Text('Text 文本')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      Text('我是一个文本')
        .textStyle()
        .fontSize(12)
        .textAlign(TextAlign.Start)
      Text('我是绿色，向中间对其')
        .textStyle()
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Green)
      Text('我是蓝色，向右对其')
        .textStyle()
        .fontSize(16)
        .textAlign(TextAlign.End)
        .fontColor(Color.Blue)
      Text('我太长了，我太长了，我太长了，我太长了')
        .textStyle()
        .fontSize(14)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(1)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // TextInput 文本输入
      Text('TextInput 文本输入')
        .fontSize(14)
        .margin({ bottom: 12})
      TextInput({
        placeholder: '单行输入',  // 无文本时显示的内容
      })
        .inputStyle()
        .fontSize(14)
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .margin({ bottom: 10 })
      TextArea({ placeholder: '多行输入' })
        .fontSize(14)
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .width(260)
        .height(80)

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // TextInput 类型
      Text('TextInput 类型')
        .fontSize(14)
        .margin({ bottom: 12})
      TextInput({ placeholder: '普通类型' })
        .type(InputType.Normal)
        .inputStyle()
        .fontSize(14)
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .margin({ bottom: 10 })
      TextInput({ placeholder: '密码类型' })
        .type(InputType.Password)
        .inputStyle()
        .fontSize(14)
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .margin({ bottom: 10 })
      TextInput({ placeholder: '数字类型' })
        .type(InputType.Number)
        .inputStyle()
        .fontSize(14)
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .margin({ bottom: 10 })
      TextInput({ placeholder: '电话号码' })
        .type(InputType.PhoneNumber)
        .inputStyle()
        .fontSize(14)
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .margin({ bottom: 10 })
      TextInput({ placeholder: '电子邮件' })
        .type(InputType.Email)
        .inputStyle()
        .fontSize(14)
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .margin({ bottom: 10 })

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Search 搜索
      Text('Search 搜索')
        .fontSize(14)
        .margin({ bottom: 12})
      Search({
        placeholder: '输入搜索内容...'
      })
        .inputStyle()
        .textFont({ size: 14 })  // 文本字体设置
        .placeholderFont({ size: 14 })  // placeholder字体设置
        .searchButton('搜索')
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