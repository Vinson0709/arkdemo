import router from '@ohos.router'; //路由
import * as Constants from '../common/Constant'; // 自定义常量

@Entry  // 页面入口（装饰器）
@Component  // 组件（装饰器）
struct Index {
  private title: string = '';  // 页面标题
  // 页面展示的列表
  private dataSource: Array<Constants.ListItem> = [];

  /**
   * 生命周期函数，创建组件实例后，执行build渲染函数之前
   */
  aboutToAppear(): void {
    const params = router.getParams(); //页面参数
    const data = Constants.SUB_LIST_DATA[params['type']];
    this.title = data?.title || '';
    this.dataSource = data?.dataSource || [];
  }

  /**
   * 返回
   */
  clickBack(): void {
    const routerState = router.getState();
    if(routerState.index > 1){
      router.back();
    }else{
      router.replaceUrl({
        url: 'pages/Index'
      })
    }
  }

  /**
   * 自定义样式：listItem
   */
  @Styles listItemStyle() {
    .width('90%')
    .height(60)
    .backgroundColor('#FFFFFF')
    .borderRadius(8)
    .padding({ left: 20, right: 20})
    .margin({ top: 10, bottom: 10})
    .shadow({
      radius: 8,
      color: '#9E9E9E',
      offsetX: 2,
      offsetY: 6
    })  // 阴影
  }

  /**
   * 列表展示（自定义builder渲染）
   */
  @Builder listBuilder() {
    List() {
      // 标题
      ListItem() {
        Row() {
          Image($r("app.media.arrowLeft"))
            .width(30)
            .height(30)
            .margin({ right: 10})
            .onClick(() => this.clickBack())
          Text(this.title)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .margin({ top: 30, bottom: 20})
        .width('90%')
        .justifyContent(FlexAlign.Start)
      }

      // 列表
      ForEach(this.dataSource, (item: Constants.ListItem) => {
        // 列表项
        ListItem() {
          Row() {
            Text(item.title)
              .fontSize(16)
          }
          .listItemStyle()
          .onClick(() => {
            router.pushUrl({ url: item.path, params: item.params || {} })
          })
        }
      }, (item: Constants.ListItem, index: number) => {
        return `${item.id}_${index}`;
      })

      // 底部留白
      ListItem().height(30)
    }
    .alignListItem(ListItemAlign.Center)
  }

  /**
   * 页面渲染 builder
   */
  build() {
    Column() {
      // 自定义builder渲染
      this.listBuilder()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}