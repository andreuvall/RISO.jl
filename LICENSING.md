# Project Licensing

This project uses a split-licensing model. The software and its test data are licensed under the AGPL. The README artwork is documentation material, is not part of the program, and is licensed separately.

| Material | Location | License |
|---|---|---|
| Source code | Everything outside `/artwork`, unless noted otherwise | AGPL-3.0-or-later |
| Test data | `/test` | AGPL-3.0-or-later (see section 2) |
| Artwork, Category A (fully original) | `/artwork`, as listed in the manifest | CC BY-NC-SA 4.0 |
| Artwork, Category B (composite derivative) | `/artwork`, as listed in the manifest | All Rights Reserved |

## 1. Software Source Code License

The source code of this Julia package, excluding the `/artwork` directory, is licensed under the **GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)**.

A complete copy of the license text is in the [LICENSE](./LICENSE) file.

The artwork is not part of the program and is not part of its Corresponding Source. The program does not require the artwork in order to run.

## 2. Test Data

The test image `test/wcmyk-squares-rgb8.png` was created by the project author and is licensed under the **AGPL-3.0-or-later**, the same as the code. This keeps the test suite fully redistributable and reproducible for anyone who packages or audits the project.

All other files in `/test` are covered by the software license in section 1.

## 3. Artwork

The artwork in the `/artwork` directory is **not** covered by the software license. It is used only to illustrate the README and other documentation. An inventory mapping each file to its license is maintained in [/artwork/Artwork.toml](./artwork/Artwork.toml).

### Category A: Fully Original Artwork

Artwork designated as fully original in the manifest is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

* **Permissions:** You may share, copy, remix, transform, and build upon these artworks with proper attribution.
* **Restrictions:** These artworks and any adaptations of them may **not** be used for commercial purposes. Modified versions must be distributed under the same license or a compatible one.

### Category B: Composite Derivative Artwork

Artwork designated as composite creations in the manifest is protected under:

**© 2026 Andreu Vall. All Rights Reserved.**

These composites include licensed and third-party sub-items that the adapter does not own, whose own license terms apply to those sub-items. Copyright asserted here applies only to the layout, compilation, modifications, and additions made by the adapter.

* **Permitted:** You may view this artwork as it appears in this repository. You may redistribute unmodified copies of this repository, including the Category B artwork as it appears in the README and `/artwork`, as part of that complete copy.
* **Not permitted:** You may not isolate, crop, extract, modify, or redistribute these files, or parts of them as they appear in these files, separately from the repository. Any independent reuse of a sub-item must be sourced from its original creator under that creator's license terms.

## 4. Contributions

Unless stated otherwise, contributions to the source code and test data are accepted under the project's license (AGPL-3.0-or-later). Contributions to `/artwork` are accepted only by prior agreement with the maintainer.

## 5. Notes for Packagers

* The program is fully functional without the `/artwork` directory. Packagers may remove that directory from packaged distributions without affecting the software or its license.
* The software and test data contain no non-free components, so packages built from `LICENSE` and `/test` alone are fully AGPL-3.0-or-later.