function registerPrivateHubEvents(rHub, viewModel) {
    var chatVM = viewModel;

    rHub.client.getPrivateMessage = function (fromId, message) {
        var window = chatVM.getPrivateChatWindow(fromId, message.FromName, message.FromTypeSpecID);
        window.addMessage(message);
    };
}