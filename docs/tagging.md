# Tagging a release

This repo's `normal-flow.yaml` workflow is triggered by pushing a semver tag to `origin`. Nothing else kicks off a release — no branch push, no manual dispatch.

## 1. Tag a commit locally

Tag the current `HEAD`:

```bash
git tag v0.1.5
```

This creates a **lightweight tag** (just a named pointer, no metadata). For release-worthy tags you often want an **annotated tag** — carries author, date, and a message:

```bash
git tag -a v0.1.5 -m "First stable release"
```

Either style works with this workflow.

## 2. Push the tag to the remote

Tags are **not** pushed by a regular `git push`. Push them explicitly:

```bash
git push origin v0.1.5
```

Or push all local tags at once:

```bash
git push origin --tags
```

## 3. What fires automatically

`normal-flow.yaml` is triggered by:

```yaml
on:
  push:
    tags:
      - 'v[0-9]+.[0-9]+.[0-9]+'
```

So `v0.1.5` triggers a run because it matches the glob (literal `v`, dots as literal dots, `+` = "one or more"). Tags like `v1.2.3-rc1` or `release-1` silently do **nothing** — no run appears in the Actions tab.

## 4. Common follow-up commands

```bash
# List local tags
git tag

# List tags on the remote
git ls-remote --tags origin

# Delete a local tag
git tag -d v0.1.5

# Delete a remote tag (after local delete)
git push origin :refs/tags/v0.1.5

# Move a tag to a different commit (force — rarely a good idea)
git tag -f v0.1.5 <new-commit>
git push origin v0.1.5 --force
```

## 5. Tagging a specific commit (not HEAD)

Default tagging uses `HEAD`. To tag an older commit:

```bash
git tag v0.1.5 <commit-sha>
git push origin v0.1.5
```

## Tips for this setup

- **Follow semver.** Bug fix → bump patch (`v0.1.4` → `v0.1.5`). New feature → bump minor (`v0.1.5` → `v0.2.0`). Breaking change → bump major (`v0.2.0` → `v1.0.0`).
- **Tag commits that are on `main`.** The workflow can tag any commit, but Flux only reconciles what's on `main`. If the tag points at a commit outside `main`, the cluster won't match what was "released".
- **Don't retag the same version.** Once `deploy-dev` has consumed a tag (pushed a commit back to `main` updating the manifests), retagging is messy. Pick a new version for retries.
