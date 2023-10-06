import router from '@ohos.router';  // 路由
import * as Constants from '../common/Constant'; // 自定义常量

@Component
export default struct NavigationBar {
  private routerState: router.RouterState = router.getState();  //当前路由状态
  @Prop title: string;  //标题

  /**
   * 点击返回
   */
  clickBack(): void {
    if (this.routerState.index > 1) {
      router.back()
    } else {
      router.replaceUrl({
        url: 'pages/Index'
      })
    }
  }

  /**
   * 组件渲染 builder
   */
  build() {
    Row() {
      // 返回
      Row() {
        Image($r('app.media.arrowLeft'))
          .width(20)
          .height(20)
          .margin({ left: 15 })
      }
      .width(50)
      .height('100%')
      .onClick(() => this.clickBack())
      Text(this.title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height(Constants.PAGE_HEADER_HEIGHT)
    .backgroundColor('#FFFFFF')
    .border({
      width: { bottom: 1 },
      color: { bottom: '#F7F9FA' }
    })
    .zIndex(100)
  }
}