import Brightness from '@system.brightness';
import * as Constants from '../common/Constant'; // 自定义常量
import NavigationBar from '../components/NavigationBar';  // 自定义导航栏

@Entry  // 页面入口（装饰器）
@Component  // 组件（装饰器）
struct Selects {
  @State title: string = '选择 Radio & Checkbox & Toggle';  // 页面标题
  private scroller: Scroller = new Scroller();  // 页面滚动条

  @State radioValue: string = 'radio1'; // radio单选框选中的value
  private radioData: Array<string> = ['radio1', 'radio2', 'radio3'];  // 单选选项

  @State checkValue: Array<string> = []; // checkbox勾选的value，支持多选
  private checkData: Array<string> = ['check1', 'check2', 'check3'];  // 勾选选项

  @State toggleCheckValue: Array<string> = ['check1']; // toggle.checkbox勾选的value，支持多选
  private toggleCheckData: Array<string> = ['check1', 'check2', 'check3'];  // 勾选选项

  @State switchValue: boolean = true; // toggle.switch开关的value

  @State buttonValue: boolean = true; // toggle.button按钮value

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
      // Radio 单选
      Text('Radio 单选')
        .fontSize(14)
        .margin({ top:20, bottom: 12})
      Row() {
        ForEach(this.radioData, (item: string) => {
          Row() {
            Radio({ value: item, group: 'radioGroup' })
              .checked(this.radioValue === item)
              .onChange(( isChecked: boolean ) => {
                if(isChecked){
                  this.radioValue = item
                  console.log(`${item} is checked`)
                }
              })
            Text(item)
              .fontSize(14)
              .onClick((event: ClickEvent) => {
                this.radioValue = item
                console.log(`${item} is checked`)
              })
          }
          .margin({left: 4, right: 4})
        })
      }

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Checkbox 勾选
      Text('Checkbox 勾选')
        .fontSize(14)
        .margin({ bottom: 12})
      Column() {
        // 全选
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          CheckboxGroup({ group: 'checkboxGroup' })
            .onChange((itemName: CheckboxGroupResult) => {
              this.checkValue = [...itemName.name];
              console.log(JSON.stringify(itemName))
            })
          Text('Check All').fontSize(14)
        }
        ForEach(this.checkData, (item: string) => {
          Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
            Checkbox({ name: item, group: 'checkboxGroup' })
            Text(item).fontSize(14)
          }.margin({ left: 36 })
        })
      }.width(160)
      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Toggle Checkbox勾选
      Text('Toggle Checkbox 勾选')
        .fontSize(14)
        .margin({ bottom: 12})
      Row() {
        ForEach(this.toggleCheckData, (item: string) => {
          Row() {
            Toggle({ type: ToggleType.Checkbox, isOn: this.toggleCheckValue.indexOf(item) !== -1 })
              .onChange(( isOn: boolean ) => {
                if(isOn){
                  this.toggleCheckValue = this.toggleCheckValue.concat(item);
                }else{
                  this.toggleCheckValue = this.toggleCheckValue.filter(value => value !== item);
                }
              })
            Text(item)
              .fontSize(14)
              .onClick((event: ClickEvent) => {
                const isOn = this.toggleCheckValue.indexOf(item) !== -1;
                if(!isOn){
                  this.toggleCheckValue = this.toggleCheckValue.concat(item);
                }else{
                  this.toggleCheckValue = this.toggleCheckValue.filter(value => value !== item);
                }
              })
          }
          .margin({left: 4, right: 4})
        })
      }

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Toggle Switch 开关
      Text('Toggle Switch 开关')
        .fontSize(14)
        .margin({ bottom: 12})
      Toggle({ type: ToggleType.Switch, isOn: this.switchValue })
        .onChange((isOn: boolean) => {
          this.switchValue = isOn;
        })

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()

      // Toggle Button 按钮
      Text('Toggle Button 按钮')
        .fontSize(14)
        .margin({ bottom: 12})
      Toggle({ type: ToggleType.Button, isOn: this.buttonValue}) {
        Text('status button')
          .fontColor('#182431')
          .fontSize(12)
      }.width(100)
      .onChange((isOn: boolean) => {
        this.buttonValue = isOn;
      })

      // 分割线
      Divider()
        .color('#CCCCCC')
        .dividerStyle()
      // 自定义样式
      Text('自定义样式')
        .fontSize(14)
        .margin({ bottom: 12})
      Row() {
        Checkbox()
          .select(true)
          .selectedColor('#07c160')
          .margin({right: 20})
        Toggle({ type: ToggleType.Checkbox, isOn: true })
          .selectedColor('#07c160')
          .margin({right: 20})
        Toggle({ type: ToggleType.Switch, isOn: true })
          .selectedColor('#07c160')
          .margin({right: 20})
        Toggle({ type: ToggleType.Switch, isOn: true })
          .selectedColor('#07c160')
          .switchPointColor('#fa9d3b')
      }
      .margin({bottom: 10})
      Row() {
        Toggle({ type: ToggleType.Button, isOn: true }) {
          Text('status button')
            .fontColor('#182431')
            .fontSize(12)
        }.width(100).selectedColor('#07c160')
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