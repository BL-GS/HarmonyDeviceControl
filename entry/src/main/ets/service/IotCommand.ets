export interface Command {
    service_id: string
    command_name: string
    paras: Paras
}

export interface Paras {
    value: string
}

export interface Properties {
    DeviceName: string
}