# my-claude-setup

المهارات والأدوات الشخصية لـ Claude Code. بتتثبت تلقائياً في أول كل جلسة cloud.

- `skills/<name>/SKILL.md` — كل مهارة بتظهر في قايمة `/`.
- `tools/<name>.sh` — سكريبت تثبيت لكل أداة (بيشتغل من فولدر الـ workspace).
- `CLAUDE.global.md` — تعليمات عامة بتتنسخ لـ `~/.claude/CLAUDE.md`.
- `install.sh` — بيشغّل كل اللي فوق.

## إضافة مهارة أو أداة جديدة
ابعت لينك GitHub لـ Claude وقوله "ضيفها لـ my-claude-setup".

## على أي جهاز تاني
```bash
git clone https://github.com/samehfadl01-source/my-claude-setup
bash my-claude-setup/install.sh
```
