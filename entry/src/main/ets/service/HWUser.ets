export class HWUser {
    auth: Auth

    constructor(name: string, password: string, domain: string) {
        this.auth = {
            "identity": {
                "methods": [
                    "password"
                ],
                "password": {
                    // IAM User Credit
                    "user": {
                        "domain": {
                            "name": domain
                        },
                        "name": name,
                        "password": password
                    }
                }
            },
            "scope": {
                "domain": {
                    // The username of administer
                    "name": domain
                }
            }
        }
    }
}

interface Auth {
    identity: Identity
    scope: Scope
}

interface Identity {
    methods: string[]
    password: Password
}

interface Password {
    user: User
}

interface User {
    name: string
    password: string
    domain: Domain
}

interface Domain {
    name: string
}

interface Scope {
    domain: Domain
}