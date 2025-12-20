# Agent Rules

## Communication
- **Language**:
  - You MUST strictly use **Japanese** for all responses, including thought process summaries, commit messages, and artifact content (unless specifically relevant to code or english-only contexts).


## Version Control (Git)
- **Forbidden Actions**:
  - Do NOT perform `git commit`.
  - Do NOT perform `git push`.
  - The user will handle all commit and push operations manually.
- **Allowed Actions**:
  - You MAY use `git status`, `git log`, `git diff`, and other read-only commands to check the repository state.

## Task Management
- **Progress Tracking**:
  - The file `docs/progress/task.md` matches the current project status.
  - You MUST update `docs/progress/task.md` whenever:
    - New tasks are identified.
    - An existing task is completed.
    - A task's status changes.
  - This file serves as the source of truth for project progress.

## Code Modifications & Verification
- **Auto-run Verification**:
  - You MAY run the following commands without asking for permission (`SafeToAutoRun: true`):
    - `./gradlew assembleDebug`
    - `./gradlew ktlintFormat`
    - `./gradlew ktlintCheck`
    - `./gradlew koverXmlReport`
    - `git status`
    - `git log`
    - `git diff`
- **Mandatory Verification**:
  - After any code modification, you MUST perform the following checks before reporting completion to the user:
    1. Run `./gradlew assembleDebug` to ensure the project builds successfully.
    2. Run `./gradlew ktlintFormat` to ensure the code follows the ktlint style guidelines.
  - If either of these commands fails, you MUST resolve the issues and re-run the checks until they pass.
