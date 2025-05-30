import { HWUser } from '../service/HWUser';
import { Properties, Command } from '../service/IotCommand';

export class IOTCredit {
    static readonly  device_id: string  = '6825c9c984adf27cda58fdfc_myNodeId'
    static readonly  host: string       = '192.168.24.167'
    static readonly  port: string       = '8080'
    static readonly  url: string        = this.host + ':' + this.port + '/distschedule-api/device/' + this.device_id + '/sendCommand'
    static readonly  serviceId: string  = 'smokeDetector'

    static readonly  command_move_forward:      Command = { serviceId: this.serviceId, commandName: 'SetCarAction',  value: '{ "action": "forward"  }' }
    static readonly  command_move_backward:     Command = { serviceId: this.serviceId, commandName: 'SetCarAction',  value: '{ "action": "backward" }' }
    static readonly  command_move_left:         Command = { serviceId: this.serviceId, commandName: 'SetCarAction',  value: '{ "action": "left"     }' }
    static readonly  command_move_right:        Command = { serviceId: this.serviceId, commandName: 'SetCarAction',  value: '{ "action": "right"    }' }
}

export class IOTStatus {
    properties: Properties = {
        DeviceName: 'Unknown',
    }
}