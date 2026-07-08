# Agent Workflow

## Roles

- Claude Code: implementation
- Codex: code review
- Testing Agent: regression validation
- Performance Agent: performance budget verification

## Workflow

```text
Read Docs
↓
Implement Sprint Task
↓
Run build/test/lint/format
↓
Open PR
↓
Codex Review
↓
Fix issues
↓
Merge
```
