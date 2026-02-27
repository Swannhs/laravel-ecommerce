$(function () {
    $(document).on('click', '.btn-trigger-add-address', function (e) {
        e.preventDefault()
        $('#add-address-modal').modal('show')
    })

    $(document).on('click', '#confirm-add-address-button', (event) => {
        event.preventDefault()
        let _self = $(event.currentTarget)

        PlatformCore.showButtonLoading(_self)

        const form = _self.closest('.modal-content').find('form')
        const url = form.prop('action')
        const formData = form.serialize()

        $httpClient
            .make()
            .post(url, formData)
            .then(({ data }) => {
                if (!data.error) {
                    PlatformCore.showNotice('success', data.message)
                    $('#add-address-modal').modal('hide')
                    form.get(0).reset()
                    $('#address-histories').load(
                        $('.page-wrapper form.js-base-form').prop('action') + ' #address-histories > *'
                    )
                } else {
                    PlatformCore.showNotice('error', data.message)
                }
            })
            .finally(() => {
                PlatformCore.hideButtonLoading(_self)
            })
    })

    $(document).on('click', '.btn-trigger-edit-address', (event) => {
        event.preventDefault()
        let _self = $(event.currentTarget)

        const $modal = $('#edit-address-modal')

        const $modalLoading = $modal.find('.modal-loading-block')
        const $modalFormContent = $('#edit-address-modal .modal-body .modal-form-content')
        $modalFormContent.html('')
        $modalLoading.removeClass('d-none')

        $modal.modal('show')

        PlatformCore.showButtonLoading(_self)

        $httpClient
            .make()
            .get(_self.data('section'))
            .then(({ data }) => {
                if (!data.error) {
                    $modalLoading.addClass('d-none')
                    $modalFormContent.html(data)
                } else {
                    PlatformCore.showNotice('error', data.message)
                }
            })
            .finally(() => {
                PlatformCore.hideButtonLoading(_self)
            })
    })

    $(document).on('click', '#confirm-edit-address-button', (event) => {
        event.preventDefault()
        let _self = $(event.currentTarget)

        PlatformCore.showButtonLoading(_self)

        const form = _self.closest('.modal-content').find('form')
        const url = form.prop('action')
        const formData = form.serialize()

        $httpClient
            .make()
            .post(url, formData)
            .then(({ data }) => {
                if (!data.error) {
                    PlatformCore.showNotice('success', data.message)
                    $('#edit-address-modal').modal('hide')
                    form.get(0).reset()
                    $('#address-histories').load(
                        $('.page-wrapper form.js-base-form').prop('action') + ' #address-histories > *'
                    )
                } else {
                    PlatformCore.showNotice('error', data.message)
                }
            })
            .finally(() => {
                PlatformCore.hideButtonLoading(_self)
            })
    })

    $(document).on('click', '.deleteDialog', function (event) {
        event.preventDefault()
        const _self = $(event.currentTarget)
        $('.delete-crud-entry').data('section', _self.data('section'))
        $('.modal-confirm-delete').modal('show')
    })

    $('.delete-crud-entry').on('click', function (event) {
        event.preventDefault()
        const _self = $(event.currentTarget)
        PlatformCore.showButtonLoading(_self)
        const deleteURL = _self.data('section')

        $httpClient
            .make()
            .post(deleteURL, { _method: 'DELETE' })
            .then(({ data }) => {
                if (data.error) {
                    PlatformCore.showError(data.message)
                } else {
                    PlatformCore.showSuccess(data.message)
                    const formAction = $('.page-wrapper form').prop('action')
                    $('#address-histories').load(formAction + ' #address-histories > *')
                }
                _self.closest('.modal').modal('hide')
            })
            .finally(() => {
                PlatformCore.hideButtonLoading(_self)
            })
    })
})
