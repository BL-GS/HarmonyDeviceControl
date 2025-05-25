import { HWUser } from '../service/HWUser';
import { Properties, Command, MoveCommand } from '../service/IotCommand';

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

    static readonly  command_power_on:          Command = { service_id: 'TS001', command_name: 'PowerOn',  paras: {} }
    static readonly  command_power_off:         Command = { service_id: 'TS001', command_name: 'PowerOff', paras: {} }
    static readonly  command_move_forward:      MoveCommand = { service_id: 'TS001', command_name: 'PowerMoveForward',  paras: { 'step': 1 } }
    static readonly  command_move_backward:     MoveCommand = { service_id: 'TS001', command_name: 'PowerMoveBackward', paras: { 'step': 1 } }
    static readonly  command_move_left:         MoveCommand = { service_id: 'TS001', command_name: 'PowerMoveLeft',     paras: { 'step': 1 } }
    static readonly  command_move_right:        MoveCommand = { service_id: 'TS001', command_name: 'PowerMoveRight',    paras: { 'step': 1 } }
}

export class IOTStatus {
    properties: Properties = {
        DeviceName: 'Unknown',
        DeviceOn: false
    }
}