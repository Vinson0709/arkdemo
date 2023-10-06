// 页面padding
export const PAGE_PADDING_LEFT: number = 20;
export const PAGE_PADDING_RIGHT: number = 20;
export const PAGE_PADDING_BOTTOM: number = 40;

// 页面顶部navigation高度
export const PAGE_HEADER_HEIGHT: number = 60;

// 页面菜单列表显示
export interface PathParams{
  type: string; // 类型
}
export interface ListItem {
  id: string; // 唯一标识
  title: string;  // 标题
  path: string; // 路径
  params?: PathParams; // 参数
}
export const HOME_LIST_DATA: Array<ListItem> = [
  {
    id: 'base',
    title: '基础组件',
    path: 'pages/Sub',
    params: { type: 'base' }
  },
  {
    id: 'layout',
    title: '布局容器',
    path: 'pages/Sub',
    params: { type: 'layout' }
  },
];

// 二级菜单
export interface SubListData {
  [propName: string]: { title: string, dataSource?: Array<ListItem> }
}
export const SUB_LIST_DATA = {
  base: {
    title: '基础组件',
    dataSource: [
      {
        id: 'buttons',
        title: '按钮 Button',
        path: 'pages/Buttons'
      },
      {
        id: 'selects',
        title: '选择 Radio & Checkbox & Toggle',
        path: 'pages/Selects'
      },
      {
        id: 'progresses',
        title: '进度条 Progress & Slider',
        path: 'pages/Progresses'
      },
      {
        id: 'texts',
        title: '文本 Text & TextInput & ...',
        path: 'pages/Texts'
      },
      {
        id: 'picker',
        title: '选择器 Picker',
        path: 'pages/Picker'
      },
      {
        id: 'loading',
        title: '加载 LoadingProgress',
        path: 'pages/Loading'
      }
    ]
  },
  layout: {
    title: '布局容器',
    dataSource: [
      {
        id: 'linear',
        title: '线性布局 Row & Column',
        path: 'pages/Linear'
      },
      {
        id: 'flexes',
        title: '弹性布局 Flex',
        path: 'pages/Flexes'
      },
      {
        id: 'stacks',
        title: '层叠布局 Stack',
        path: 'pages/Stacks'
      },
      {
        id: 'grids',
        title: '栅格布局 Grid',
        path: 'pages/Grids'
      },
      {
        id: 'lists',
        title: '列表布局 List',
        path: 'pages/Lists'
      },
      {
        id: 'scrolls',
        title: '滚动容器 Scroll',
        path: 'pages/Scrolls'
      },
      {
        id: 'tab',
        title: '页签容器 Tabs',
        path: 'pages/Tab'
      }
    ]
  }
}