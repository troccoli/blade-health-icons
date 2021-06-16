<p>
    <img src="./socialcard-blade-health-icons.png" alt="Social Card Blade Healt Icons"/>
</p>

# Blade Health Icons

<a href="https://github.com/troccoli/blade-health-icons/actions?query=workflow%3ATests">
    <img src="https://github.com/blade-ui-kit/blade-health-icons/workflows/Tests/badge.svg" alt="Tests">
</a>
<a href="https://github.styleci.io/repos/258753939">
    <img src="https://github.styleci.io/repos/258753939/shield?style=flat" alt="Code Style">
</a>
<a href="https://packagist.org/packages/troccoli/blade-health-icons">
    <img src="https://img.shields.io/packagist/v/blade-ui-kit/blade-health-icons" alt="Latest Stable Version">
</a>
<a href="https://packagist.org/packages/troccoli/blade-health-icons">
    <img src="https://img.shields.io/packagist/dt/troccoli/blade-health-icons" alt="Total Downloads">
</a>

A package to easily make use of [Health Icons](https://github.com/resolvetosavelives/healthicons) in your Laravel Blade views.

For a full list of available icons see [the SVG directory](resources/svg) or preview them at [healthicons.org](https://healthicons.org).

## Requirements

- PHP 7.4 or higher
- Laravel 8.0 or higher

## Installation

```bash
composer require troccoli/blade-health-icons
```

## Blade Icons

Blade Healthicons uses Blade Icons under the hood. Please refer to [the Blade Icons readme](https://github.com/blade-ui-kit/blade-icons) for additional functionality. We also recommend to [enable icon caching](https://github.com/blade-ui-kit/blade-icons#caching) with this library.

## Configuration

Blade Healthicons also offers the ability to use features from Blade Icons like default classes, default attributes, etc. If you'd like to configure these, publish the `blade-health-icons.php` config file:

```bash
php artisan vendor:publish --tag=blade-health-icons-config
```

## Usage

Icons can be used as self-closing Blade components which will be compiled to SVG icons:

```blade
<x-health-icon-o-blood-a-n/>
```

You can also pass classes to your icon components:

```blade
<x-health-icon-o-blood-a-n class="w-6 h-6 text-gray-500"/>
```

And even use inline styles:

```blade
<x-health-icon-o-blood-a-n style="color: #555"/>
```

The solid icons can be referenced like this:

```blade
<x-health-icon-s-blood-a-n/>
```

### Raw SVG Icons

If you want to use the raw SVG icons as assets, you can publish them using:

```bash
php artisan vendor:publish --tag=blade-health-icons --force
```

Then use them in your views like:

```blade
<img src="{{ asset('vendor/blade-health-icons/o-blood-a-n.svg') }}" width="10" height="10"/>
```

## Changelog

Check out the [CHANGELOG](CHANGELOG.md) in this repository for all the recent changes.

## Maintainers

Blade Healthicons is developed and maintained by [Giulio Troccoli-Allard](https://troccoli.it).

## License

Blade Healthicons is open-sourced software licensed under [the MIT license](LICENSE.md).