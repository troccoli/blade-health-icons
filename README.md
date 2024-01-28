<p>
    <img src="./socialcard-blade-health-icons.png" alt="Social Card Blade Health Icons"/>
</p>

# Blade Health Icons

[![Tests](https://github.com/troccoli/blade-health-icons/actions/workflows/test.yml/badge.svg)](https://github.com/troccoli/blade-health-icons/actions/workflows/test.yml)
![StyleCI](https://github.styleci.io/repos/377539924/shield?style=flat)
![Packagist Version](https://img.shields.io/packagist/v/troccoli/blade-health-icons)
![Packagist Downloads](https://img.shields.io/packagist/dt/troccoli/blade-health-icons)

A package to easily make use of [Health Icons](https://github.com/resolvetosavelives/healthicons) in your Laravel Blade views.

For a full list of available icons see [the SVG directory](resources/svg) or preview them at [healthicons.org](https://healthicons.org).

## Requirements

- PHP 8.1 or higher
- Laravel 10.0 or higher

## Installation

```bash
composer require troccoli/blade-health-icons
```

The people at [Healthicons.org](https://healthicons.org/) have now moved to published the icon as an NPM package
following SemVer. This means that I can now tie the releases of this package to that one.

Versions of Blade Health Icon prior to 3.0.0 were based on a date, i.e. from time to time, or when I knew new
icons were available, I would update this package and make a new release.

From now on however, I will follow Healthicons.org versioning, albeit with a slight difference because I had already
started using SemVer.

For this reason, if you want a particular version of the Healthicons.org package then you need to look at
the following table and use the correct version for this package.

| Blade Health Icons | Healthicons.org |
|-------------------|----------------|
| 3.0.0 | 1.0.0 |

## Blade Icons

Blade Healthicons uses Blade Icons under the hood. Please refer to [the Blade Icons readme](https://github.com/blade-ui-kit/blade-icons) for additional functionality. We also recommend to [enable icon caching](https://github.com/blade-ui-kit/blade-icons#caching) with this library.

## Configuration

Blade Healthicons also offers the ability to use features from Blade Icons like default classes, default attributes, etc. If you'd like to configure these, publish the `blade-health-icons.php` config file:

```bash
php artisan vendor:publish --tag=blade-health-icons-config
```

## Usage

Health Icons provides two types of icons: filled and outlined.

Once you have found the icon you want to use on their [site](https://healthicons.org/), click on it and make a note of
the filename. The name of the icon to use will be the filename, where you replace the underscore with dashes.
For example, the Blood A- icon's filename is `blood_a_n`, so the name for the icon will be `blood-a-n`.

Icons can be used as self-closing Blade components which will be compiled to SVG icons:

```blade
<x-healthicons-o-blood-a-n/>
```

You can also pass classes to your icon components:

```blade
<x-healthicons-o-blood-a-n class="w-6 h-6 text-gray-500"/>
```

And even use inline styles:

```blade
<x-healthicons-o-blood-a-n style="color: #555"/>
```

The filled icons can be referenced like this:

```blade
<x-healthicons-f-blood-a-n/>
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
