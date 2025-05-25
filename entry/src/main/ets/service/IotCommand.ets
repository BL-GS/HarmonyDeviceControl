export interface EmptyParas {}

export interface Command {
    service_id:   string
    command_name: string
    paras:        EmptyParas
}

export interface MoveParas {
    step: number
}

export interface MoveCommand {
    service_id:   string
    command_name: string
    paras:        MoveParas
}

export interface Properties {
    DeviceName: string
    DeviceOn: boolean
}