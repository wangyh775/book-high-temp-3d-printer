# GitHub Main 分支保护配置指南 (BRANCH_PROTECTION.md)

为了防止协作过程中误向 `main` 分支直接 Push，以及防止破坏 Typst / HTML 编译状态，请仓库管理员（Repo Owner/Admin）按以下方案为 `main` 分支开启保护门禁。

---

## 方案 A：通过 GitHub CLI 一键开启（推荐）

如果已安装并登录 [GitHub CLI (`gh`)](https://cli.github.com/)，在项目根目录下执行以下命令即可一键配置：

```bash
gh api --method PUT /repos/:owner/:repo/branches/main/protection \
  --input - <<< '{
    "required_status_checks": {
      "strict": true,
      "contexts": ["build"]
    },
    "enforce_admins": true,
    "required_pull_request_reviews": {
      "dismiss_stale_reviews": true,
      "require_code_owner_reviews": false,
      "required_approving_review_count": 1
    },
    "restrictions": null,
    "allow_force_pushes": false,
    "allow_deletions": false
  }'
```

*(注：请将 `:owner/:repo` 替换为你的 GitHub 组织与仓库名，例如 `DJTU/book-high-temp-3d-printer`)*

---

## 方案 B：通过 GitHub 网页端手动配置

1. 打开 GitHub 仓库页面，点击右上角 **Settings**；
2. 在左侧侧边栏选择 **Branches**（或 **Rules** -> **Rulesets**）；
3. 点击 **Add branch protection rule**：
   * **Branch name pattern**：输入 `main`
4. 勾选以下核心防护门禁：
   * ✅ **Require a pull request before merging**
     * 勾选 **Require approvals**，设置数量为 `1`
     * 勾选 **Dismiss stale pull request approvals when new commits are pushed**（有新提交时重置审核）
   * ✅ **Require status checks to pass before merging**
     * 勾选 **Require branches to be up to date before merging**
     * 在下方搜索框中输入并选中：`build`（对应 GitHub Actions 中的 Typst/HTML 编译任务）
   * ✅ **Do not allow bypassing the above settings**（对管理员同样生效，防手滑直接 Push）
5. 点击下方绿色按钮 **Create** / **Save changes** 保存。

---

## 效果验证

完成上述配置后：

1. 任何成员在本地执行 `git push origin main` 将直接被 GitHub 服务端拒绝（`remote rejected: push declined due to branch protection`）；
2. 所有人必须在特性分支工作并通过 PR 提交；
3. PR 界面中，只有当 `build`（Typst 与 HTML 编译）显示绿色对勾且获得至少 1 个 Approve 后，`Merge pull request` 按钮才可点击。
