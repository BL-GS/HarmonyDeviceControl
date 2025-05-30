import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { IOTCredit } from './Credit'

export class HttpTool {

    static get(url: string, fn: Function) {
        let httpRequest = http.createHttp()
        let options: http.HttpRequestOptions = {
            method: http.RequestMethod.GET,
            expectDataType: http.HttpDataType.OBJECT,
            header: { 'Content-Type': 'application/json', },
        }

        httpRequest.request(url, options, (err: BusinessError, data: http.HttpResponse) => {
            if (!err) {
                fn(data)
            } else {
                hilog.error(0, 'HTTPTool', JSON.stringify(err))
            }
            httpRequest.destroy()
        })
    }

    /**
     * Post request to the huawei cloud platform
     * @param url   URL to the platform
     * @param param Request content
     * @param fn    Callback function
     */
    static post(url: string, param: string | Object | ArrayBuffer, fn: Function) {
        let httpRequest = http.createHttp()
        let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            extraData: param,
            expectDataType: http.HttpDataType.OBJECT, // 可选，指定返回数据的类型
            header: { 'Content-Type': 'application/json', },
        }

        hilog.info(0, 'HTTPTool', 'send post request to ' + IOTCredit.url + ': ' + JSON.stringify(param))

        httpRequest.request(url, options, (err: BusinessError, data: http.HttpResponse) => {
            if (!err) {
                fn(data)
            } else {
                hilog.error(0, 'HTTPTool', JSON.stringify(err))
            }
            httpRequest.destroy()
        })
    }
}