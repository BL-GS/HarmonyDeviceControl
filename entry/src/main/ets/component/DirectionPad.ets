import { IOTCredit } from "../service/Credit";
import { HttpTool } from "../service/HttpTool";
import { http } from "@kit.NetworkKit";
import { hilog } from "@kit.PerformanceAnalysisKit";

@Component
export struct DirectionPad {
    build() {
        Column({ space: 10 }) {
            // 上按钮
            Button('↑')
                .onClick(() => {
                    hilog.info(0, 'DirectionPad', 'Click Button: Forward');

                    HttpTool.post(IOTCredit.url, IOTCredit.command_move_forward, (data: http.HttpResponse) => {
                        hilog.info(0, 'Command Forward:', JSON.stringify(data.result))
                    })
                })
                .width(80)
                .height(40)
                .foregroundColor('#2196F3')
                .fontColor('#FFFFFF')

            // 中间行（左、中、右）
            Row({ space: 10 }) {
                Button('←')
                    .onClick(() => {
                        hilog.info(0, 'DirectionPad', 'Click Button: Left');

                        HttpTool.post(IOTCredit.url, IOTCredit.command_move_left, (data: http.HttpResponse) => {
                            hilog.info(0, 'Command Forward:', JSON.stringify(data.result))
                        })
                    })
                    .width(80)
                    .height(40)
                    .foregroundColor('#2196F3')
                    .fontColor('#FFFFFF')

                // 可选中间按钮
                Text('◆')
                    .fontSize(16)
                    .onClick(() => {
                        hilog.info(0, 'DirectionPad', 'Click Button: Middle');
                    })
                    .width(80)
                    .height(40)
                    .textAlign(TextAlign.Center)
                    .fontColor('#000000')

                Button('→')
                    .onClick(() => {
                        hilog.info(0, 'DirectionPad', 'Click Button: Right');

                        HttpTool.post(IOTCredit.url, IOTCredit.command_move_right, (data: http.HttpResponse) => {
                            hilog.info(0, 'Command Forward:', JSON.stringify(data.result))
                        })
                    })
                    .width(80)
                    .height(40)
                    .foregroundColor('#2196F3')
                    .fontColor('#FFFFFF')

            }

            // 下按钮
            Button('↓')
                .onClick(() => {
                    hilog.info(0, 'DirectionPad', 'Click Button: Backward');

                    HttpTool.post(IOTCredit.url, IOTCredit.command_move_backward, (data: http.HttpResponse) => {
                        hilog.info(0, 'Command Forward:', JSON.stringify(data.result))
                    })
                })
                .width(80)
                .height(40)
                .foregroundColor('#2196F3')
                .fontColor('#FFFFFF')
        }
        .width('90%')
        .padding({ top: 20, bottom: 20 })
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#F9F9F9')
    }

}

