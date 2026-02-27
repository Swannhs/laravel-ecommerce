export class MessageService {
    static showMessage(type, message) {
        PlatformCore.showNotice(type, message)
    }
}
