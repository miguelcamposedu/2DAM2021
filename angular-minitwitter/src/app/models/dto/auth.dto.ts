export class AuthLoginDto {
    email: string;
    password: string;

    constructor() {
        this.email = '';
        this.password = '';
    }
}