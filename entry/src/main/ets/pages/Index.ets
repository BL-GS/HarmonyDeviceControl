import { hilog } from '@kit.PerformanceAnalysisKit';
import { Constants } from '../common/Constants';
import { DirectionPad } from '../component/DirectionPad';
import { StatusPanel } from '../component/StatusPane';

@Entry
@Component
struct Index {
    @State currentIndex:    number = 0;
    private tabsController: TabsController = new TabsController();

    canSwitchToControlTab(): boolean {
        return AppStorage.get('isConnected') === true && AppStorage.get('isAlive') === true;
    }

    @Builder
    tabBuilder(title: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
        Column() {
            Image(this.currentIndex === index ? selectedImg : normalImg)
                .width(24)
                .height(24)
                .objectFit(ImageFit.Contain)
            Text(title)
                .margin({ top: 4 })
                .fontSize(10)
                .fontColor(this.currentIndex === index ? '#3388ff' : '#E6000000')
        }
        .justifyContent(FlexAlign.Center)
        .height(52)
        .width('100%')
        .onClick(() => {
            hilog.info(0, 'TabView', `Click ${index}`)
            if (index === Constants.TAB_INDEX_ONE && !this.canSwitchToControlTab()) {
                AlertDialog.show({ message: $r('app.string.connection_requirement') });
                return;
            }

            // 允许切换
            this.currentIndex = index;
            this.tabsController.changeIndex(this.currentIndex);
        })
    }

    @Builder
    tabContentBuilder(text: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
        TabContent() {
            if (index == 0) {
                Column() {
                    StatusPanel()
                }
                .width('100%')
                .justifyContent(FlexAlign.Center)

            } else {
                Column() {
                    DirectionPad()
                }
                .width('100%')
                .justifyContent(FlexAlign.Center)
            }
        }
        .padding({ left: 12, right: 12 })
        .backgroundColor(Color.White)
        .tabBar(this.tabBuilder(text, index, selectedImg, normalImg))
    }

    build() {
        Tabs({
            barPosition: BarPosition.End,
            controller: this.tabsController
        }) {
            this.tabContentBuilder($r('app.string.status'),
                Constants.TAB_INDEX_ZERO, $r('app.media.active_status'), $r('app.media.status'))
            this.tabContentBuilder($r('app.string.control'),
                Constants.TAB_INDEX_ONE, $r('app.media.active_control'), $r("app.media.active_control"))
        }
        .width('100%')
        .backgroundColor('#F3F4F5')
        .barHeight(52)
        .barMode(BarMode.Fixed)
    }
}