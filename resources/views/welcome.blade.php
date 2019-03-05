@extends('include.master')


@section('title','Belontory | Dashboard')


@section('page-title','DashBoard')


@section('content')
            <info-box></info-box>

@endsection


@push('script')

<script type="text/javascript" src="{{ url('public/js/dashboard.js') }}"></script>

@endpush