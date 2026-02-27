<script type="text/javascript">
    var PlatformCoreVariables = PlatformCoreVariables || {};

    @if (Auth::guard()->check())
        PlatformCoreVariables.languages = {
            tables: {{ Js::from(trans('core/base::tables')) }},
            notices_msg: {{ Js::from(trans('core/base::notices')) }},
            pagination: {{ Js::from(trans('pagination')) }},
        };
        PlatformCoreVariables.authorized =
            "{{ setting('membership_authorization_at') && Carbon\Carbon::now()->diffInDays(Carbon\Carbon::createFromFormat('Y-m-d H:i:s', setting('membership_authorization_at'))) <= 7 ? 1 : 0 }}";
        PlatformCoreVariables.authorize_url = "{{ route('membership.authorize') }}";

        PlatformCoreVariables.menu_item_count_url = "{{ route('menu-items-count') }}";
    @else
        PlatformCoreVariables.languages = {
            notices_msg: {{ Js::from(trans('core/base::notices')) }},
        };
    @endif
</script>

@push('footer')
    @if (Session::has('success_msg') || Session::has('error_msg') || (isset($errors) && $errors->any()) || isset($error_msg))
        <script type="text/javascript">
            $(function() {
                @if (Session::has('success_msg'))
                    PlatformCore.showSuccess('{!! BaseHelper::cleanToastMessage(session('success_msg')) !!}');
                @endif
                @if (Session::has('error_msg'))
                    PlatformCore.showError('{!! BaseHelper::cleanToastMessage(session('error_msg')) !!}');
                @endif
                @if (isset($error_msg))
                    PlatformCore.showError('{!! BaseHelper::cleanToastMessage($error_msg) !!}');
                @endif
                @if (isset($errors))
                    @foreach ($errors->all() as $error)
                        PlatformCore.showError('{!! BaseHelper::cleanToastMessage($error) !!}');
                    @endforeach
                @endif
            })
        </script>
    @endif
@endpush
