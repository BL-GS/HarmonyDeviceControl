@Component
export struct DirectionPad {
    build() {
        Column({ space: 10 }) {
            // 上按钮
            Button('↑')
                .onClick(() => {
                    console.info('上方向被点击');
                    this.handleDirection('up');
                })
                .width(80)
                .height(40)

            // 中间行（左、中、右）
            Row({ space: 10 }) {
                Button('←')
                    .onClick(() => {
                        console.info('左方向被点击');
                        this.handleDirection('left');
                    })
                    .width(80)
                    .height(40)

                // 可选中间按钮
                Text('◆')
                    .fontSize(16)
                    .onClick(() => {
                        console.info('中间按钮被点击');
                    })
                    .width(80)
                    .height(40)
                    .textAlign(TextAlign.Center)

                Button('→')
                    .onClick(() => {
                        console.info('右方向被点击');
                        this.handleDirection('right');
                    })
                    .width(80)
                    .height(40)
            }

            // 下按钮
            Button('↓')
                .onClick(() => {
                    console.info('下方向被点击');
                    this.handleDirection('down');
                })
                .width(80)
                .height(40)
        }
        .width('90%')
        .padding({ top: 20, bottom: 20 })
        .alignItems(HorizontalAlign.Center)
    }

    // 处理方向逻辑
    handleDirection(direction: string): void {
        // 这里可以添加你的业务逻辑
        console.info(`你点击了方向键：${direction}`);
    }
}

