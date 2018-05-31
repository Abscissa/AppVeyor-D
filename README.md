AppVeyor-D [![Build status](https://ci.appveyor.com/api/projects/status/g7b9tfp5qo6xuv7o/branch/master?svg=true)](https://ci.appveyor.com/project/Abscissa/appveyor-d/branch/master)
==========

This project exists to provide a single place for the latest help using
[AppVeyor](https://www.appveyor.com/) for Windows-based continuous-integration
("CI") testing with [D](https://dlang.org) projects.

If you're interesting in using AppVeyor to do CI testing on your D project,
do the following:

1. Copy the latest [`appveyor.yml`](https://github.com/Abscissa/AppVeyor-D/blob/master/appveyor.yml)
from this project into your own D-language project
(prefereably [GitHub](https://github.com/)-hosted.)
Adjust for your own project as needeed.

2. Go to [AppVeyor](https://www.appveyor.com/) to setup your account and your project's GitHub repository.

3. Within AppVeyor, go to your project's settings. Inside the "Build" tab, change
from "msbuild" to "script".

4. Check back here regularly, to https://github.com/Abscissa/AppVeyor-D,
for support, to contribute, and to get updates for your `appveyor.yml` file.

This project aims to provide MAXIMUM backwards compatability.
This is important, because it is intended to help any D user utilize AppVeyor
for their own needs, whatever those needs may be. Any regressions or
removal of compantibility (if any at all), requires STRONG evidence that
maintaining compatibility is impossible without causing fundamental,
unavoidable problems.

In particular, the more D compilers this supports, INCLUDING OLD VERSIONS,
the better. This project aims to only ADD support for additional versions
of D compilers, WITHOUT dropping support for older versions.

Technical Q&A
=============

Q: Why `'%DC% --help'` instead of `'%DC% --version'`

A: Older versions of DMD don't support the --version flag.

Q: Why does it sometimes download RDMD?

A: Some older versions of LDC and GDC don't come with RDMD. If RDMD is not
included with the compiler, then it is automatically downloaded and installed.

Q: Why does it always download a specific version of DUB?

A: For one thing, not all older compilers include DUB. But more importantly,
since DUB releases are now bundled with DMD, many DMD releases
(except the latest) now include outdated versions of DUB.

Furthermore, DUB has strong a history of fixing critical probelms and
adding important features without creating regressions. Additionally,
DUB does not currently support any mechanism for projects to specify
their own DUB version requirements.

Therefore, even as an extremely strong believer in the importance of keeping
legacy software available: Due to the above factors, this project considers
DUB to be one notable case where, without very strong reason otherwise,
only the latest available version should ever be used.

That said, there are two possible exceptions to this policy:

1. If a version of DUB is ever released which is known to have important
regressions, backwards compatibility breakages, or otherwise requires
special handling, this project aims to satisfy that need as well as it can.

2. In the spirit of enhancements without regressions: This project will accept
well-engineered enhancement pull-requests which add support for optional
user-specified overrides of the recommended version of DUB.

Q: Why is `$urls` an array? And why is it given two values when requesting a
specific version of LDC?

A: Starting with version v1.7.0, LDC changed its download naming scheme,
and also switched from zip archives to 7z. By using an array of alternate URLs,
appveyor-d is able to support both v1.7.0 (and up) as well as v1.6.0 (and below).

Additionally, this makes it easier to support URL mirrors in the future,
in case the primary download URL happends to be down.

Q. Why is the compiler archive always downloaded as "c:\compiler.archive"
instead of "c:\dmd.7z" or c:\ldc.zip", etc?

A. Some compiler versions are only offered in zip format (older Windows
versions of DMD and LDC), and some are only in 7z format (newer versions of LDC).
By ignoring the "proper" extensions and always using the same filename,
appveyor-d is able to support many different versions of various D compilers
without adding unnecessary complications to the archive-extraction code
(which, happily, works exactly the same regardless of the archive's name
or whether it's zip or 7z.)

But that said, enhancement PRs are welcome, as long as they preserve all
existing compiler compatibility.
