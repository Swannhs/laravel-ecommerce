$(() => {
    $(document).on('click', '.invoice-generate', (event) => {
        event.preventDefault()

        const _self = $(event.currentTarget)
        const url = $(_self.find('span[data-trigger]')).data('url')

        $httpClient
            .make()
            .withButtonLoading(_self)
            .get(url)
            .then(({ data }) => {
                PlatformCore.showSuccess(data.message)

                window.LaravelDataTables['platformcore-ecommerce-tables-invoice-table'].draw()
            })
    })
})
