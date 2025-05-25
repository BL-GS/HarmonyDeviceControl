import { HWUser } from '../service/HWUser';
import { Properties, Command } from '../service/IotCommand';

export class IOTCredit {
    static readonly  url: string = 'https://iam.myhuaweicloud.com/v3/auth/tokens'
    static readonly  hw_user = new HWUser(
        'TODO',       // UserName
        'TODO',         // Password
        'TODO'    // Admin UserName
    )

    static readonly  endpoint: string   = 'TODO'
    static readonly  project_id: string = 'TODO'
    static readonly  device_id: string  = 'TODO'

    static readonly  url1: string = 'https://' + this.endpoint + '/v5/iot/' + this.project_id + '/devices/' + this.device_id + '/shadow'
    static readonly  url2: string = 'https://' + this.endpoint + '/v5/iot/' + this.project_id + '/devices/' + this.device_id + '/commands'

    static readonly  command_get_name: Command = { service_id: 'TS001', command_name: 'GetName', paras: { 'value': 'Emulator' } }
}

export class IOTStatus {
    properties: Properties = { DeviceName: 'Unknown' }
}