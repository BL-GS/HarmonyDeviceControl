import { IOTStatus } from "../service/Credit"
import { hilog } from "@kit.PerformanceAnalysisKit"

@Component
export struct StatusPanel {
    @State isConnected: boolean   = false
    @State isAlive:     boolean   = false
    @State status:      IOTStatus = new IOTStatus()

    // 获取状态颜色
    getStatusColor(status: boolean): ResourceColor {
        return status ? '#00FF00' : '#FF0000'
    }

    build() {
        Column({ space: 15 }) {
            Text($r('app.string.device_control_pane'))
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Start)
                .width('100%')
                .padding({ bottom: 10 })
                .borderColor('#CCCCCC')

            Row({ space: 10 }) {
                Text($r('app.string.connection_status'))
                    .width(100)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#333333')
                    .textAlign(TextAlign.End)

                Text(this.isConnected ? $r('app.string.connection_connected') : $r('app.string.connection_disconnected'))
                    .width(120)
                    .fontSize(18)
                    .fontColor('#555555')
                    .textAlign(TextAlign.Start)

                Circle()
                    .width(12)
                    .height(12)
                    .foregroundColor(this.getStatusColor(this.isConnected))
            }
            .width('100%')

            Row({ space: 10 }) {
                Text($r('app.string.device_status'))
                    .width(100)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#333333')
                    .textAlign(TextAlign.End)

                Text(this.isAlive ? $r('app.string.device_alive') : $r('app.string.device_inalive'))
                    .width(120)
                    .fontSize(18)
                    .fontColor('#555555')
                    .textAlign(TextAlign.Start)

                Circle()
                    .width(12)
                    .height(12)
                    .foregroundColor(this.getStatusColor(this.isAlive))
            }
            .width('100%')

            Row({ space: 10 }) {
                Text($r('app.string.device_name'))
                    .width(100)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#333333')
                    .textAlign(TextAlign.End)

                Text(this.status.properties.DeviceName)
                    .width(140)
                    .fontSize(18)
                    .fontColor('#555555')
                    .textAlign(TextAlign.Start)
            }
            .width('100%')

            Row({ space: 30 }) {
                Button(this.isConnected ? $r('app.string.connection_disconnect') : $r('app.string.connection_connect'))
                    .width(120)
                    .height(40)
                    .backgroundColor('#4CAF50')
                    .fontColor('#FFFFFF')
                    .fontSize(16)
                    .borderRadius(8)
                    .onClick(() => {
                        if (this.isConnected) {
                            if (this.isAlive) {
                                AlertDialog.show({ message: $r('app.string.disconnect_warning') });
                                return;
                            }
                        }

                        this.isConnected = !this.isConnected;
                        AppStorage.set('isConnected', this.isConnected);
                    })

                Button(this.isAlive ? $r('app.string.device_stop') : $r('app.string.device_start'))
                    .width(120)
                    .height(40)
                    .backgroundColor('#2196F3')
                    .fontColor('#FFFFFF')
                    .fontSize(16)
                    .borderRadius(8)
                    .enabled(this.isConnected)
                    .onClick(() => {
                        if (!this.isConnected) {
                            AlertDialog.show({ message: $r('app.string.disconnect_warning') });
                            return;
                        }

                        if (!this.isAlive) {
                            hilog.info(0, 'Command Device On:', "Success")
                            this.isAlive            = true
                            AppStorage.set('isAlive', true);
                        } else {
                            hilog.info(0, 'Command Device Off:', "Success")
                            this.isAlive            = false
                            AppStorage.set('isAlive', false);
                        }
                    })
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .margin({ top: 20 })
        }
        .width('90%')
        .padding({ left: 20, right: 20, top: 15, bottom: 15 })
        .backgroundColor('#F9F9F9')
        .borderRadius(12)
        .margin({ left: 15, right: 15 })
    }
}