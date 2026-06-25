# Squad — Try It Yourself 🥊

*A hands-on follow-along from the **build:// localhost · Oslo 2026** session
"Human-led AI agent teams with Squad."*

You'll give a fresh repo its own **AI dev team that lives in the repo as files**,
have it fan out and build a small app in parallel, capture a team decision to
memory, and turn **GitHub Issues into pull requests** — staying the human who
says *merge*. Budget **~30–45 minutes**.

> **The one idea:** Squad isn't a chatbot wearing hats. It's a *team of
> specialists* that persist across sessions, share decisions, and pick up your
> backlog — while **you stay in charge**.

---

## 1 · Prerequisites (one-time setup)

| You need | Check / install |
|----------|-----------------|
| **Node.js 18+** | `node --version` · <https://nodejs.org> |
| **GitHub account + Copilot subscription** | Any paid Copilot plan (Individual/Business) |
| **GitHub CLI** | `gh --version` · <https://cli.github.com> — then `gh auth login` |
| **GitHub Copilot CLI** | `npm install -g @github/copilot` (or `winget install GitHub.Copilot`) — then run `copilot` once to sign in |
| **Squad CLI** | `npm install -g @bradygaster/squad-cli` |

Verify Squad is healthy:

```bash
squad --version      # 0.10.x or newer
squad doctor         # should report all checks passing
```

📚 **Official docs:** <https://bradygaster.github.io/squad/docs/get-started/installation/>

---

## 2 · Create a project and add a squad

Squad's whole pitch is **one command adds an AI team to any project**.

```bash
# a fresh app to give a team to
npm create vite@latest oslo-meetup -- --template react
cd oslo-meetup
npm install
git init && git add -A && git commit -m "scaffold"

# add the team — this creates the .squad/ folder
squad init
```

Look at what just appeared:

```bash
ls .squad        # roles, decisions.md, casting/, templates/ ...
```

> 💡 The team is now **files in your repo**. Commit them — anyone who clones the
> repo gets the team *and its memory*.

---

## 3 · Form the team (and give it a universe) 🎭

Start the Copilot CLI with the Squad agent:

```bash
copilot --agent squad
```

Then talk to it:

```
We're building "Oslo Meetup" — a tiny event-companion app in React + Vite.
Form a team for it.
```

**✨ Tip — personify your squad.** Before accepting the default roster, give them
a theme. It's fun *and* it makes the agents memorable in standups/PRs:

```
Cast the team as Magic: The Gathering planeswalkers.
Keep Ralph and Scribe as they are.
```

> Two agents are **always** present no matter the theme: **Ralph** (the watch
> loop) and **Scribe** (the documentarian).

**✨ Tip — plan before code.** For anything new, ask for a plan first:

```
Before any code — plan it. What pages and components do we need?
```

---

## 4 · Fan out and build — in parallel ⚡

**✨ Tip — arm them with skills first.** Pull in reusable skills from a
marketplace so they produce better output:

```bash
# in a second terminal
squad plugin marketplace add github/awesome-copilot
squad plugin marketplace list
squad plugin marketplace browse awesome-copilot
```

Back in the squad, the magic word is **"Team,"** — it fans the work out across
multiple agents at once (and the tester starts writing cases in parallel):

```
Use those skills and reason over our codebase first.
Team, build the session-listing page — cards with talk title, speaker, time
and room. Fan out.
```

Watch multiple agents spawn and work simultaneously. Run the app any time:

```bash
npm run dev      # http://localhost:5173
```

---

## 5 · Give the team a memory 🧠

Decisions are written to `.squad/decisions.md` and **every agent reads them
first** — so the team stays consistent across sessions.

```
Decision: always use single quotes in JS/JSX across this project.
```

Confirm it landed:

```bash
cat .squad/decisions.md
```

**✨ Tip — end with Scribe.** Close a working session by letting Scribe write it
up:

```
Scribe, document what we did this session.
```

---

## 6 · The centerpiece: GitHub Issues → Pull Requests 🚀

This is where Squad clicks into your real workflow. Create a few issues as your
backlog (label them `squad` so the team knows to pick them up):

```bash
gh issue create --title "Add an RSVP form to reserve a seat"         --label squad --body "A simple form to reserve a seat."
gh issue create --title "Add a filter/search bar to the session list" --label squad --body "Filter sessions by title or speaker."
gh issue create --title "Add a dark/light theme toggle"               --label squad --body "Persist the choice."
```

> If the `squad` label doesn't exist yet:
> `gh label create squad --color 5319e7 --description "Work for the squad"`

Then in the squad:

```
Show me the backlog. Pick up issue #1 (the RSVP form), implement it on a
branch, and open a pull request.
```

The lead triages the `squad` label, routes it to the right team member, and a
**pull request** appears — **you** review and merge. You stay the one who says
*yes*.

```bash
gh pr list       # the PR the squad opened
```

---

## 7 · Two kinds of autonomy (optional, advanced)

### Ralph — the watch loop
Ralph scans your backlog on its own. By default it only **monitors**; acting is
**opt-in**.

```bash
squad triage                       # safe, read-only: see what Ralph would pick up
squad triage --execute --interval 1   # Ralph ACTS — spawns agents on squad-labeled issues
# Ctrl+C to stop the loop
```

### @copilot — the GitHub coding agent
Hand an issue to **@copilot** and it drafts a PR **on GitHub itself**, no
terminal needed. Add Copilot as a member:

```bash
squad copilot --auto-assign
```

> ⚙️ Auto-assign needs a **classic PAT with `repo` scope** stored as a repo
> secret named `COPILOT_ASSIGN_TOKEN`:
> create one at <https://github.com/settings/tokens/new> (scope: `repo`), then
> `gh secret set COPILOT_ASSIGN_TOKEN` and paste it.
> Label an issue `squad:copilot` and @copilot opens a **draft PR** for it.

---

## 8 · Stay in control of cost 💰

Autonomy = spend. Check usage any time, and cap it:

```bash
squad cost           # token usage for this session
squad cost --all     # everything so far
```

> 💡 You can set a **squad budget** so the team never spends more than you allow.

---

## Cheat sheet — the whole flow

```text
squad init                         add a team to any repo
copilot --agent squad              start working with the team
  "Form a team … cast as <universe>, keep Ralph & Scribe"
  "Before any code — plan it."
  "Team, build … . Fan out."       ← fans work out in parallel
  "Decision: …"                    ← lands in .squad/decisions.md
  "Scribe, document this session."
gh issue create --label squad …    your backlog = GitHub Issues
  "Pick up issue #N, open a PR."   ← Issues → PRs, you merge
squad triage [--execute]           Ralph: the watch loop
squad copilot --auto-assign        add @copilot as a member
squad cost [--all]                 stay in control of spend
```

---

## Go deeper

- **Squad repo:** <https://github.com/bradygaster/squad>
- **Squad docs:** <https://bradygaster.github.io/squad>
- **Squad skills workshop (Tamir Dresher):** <https://github.com/tamirdresher/squad-skills>

> *Not agents instead of you. A team that lives in your repo, remembers what you
> decided, and does the parallel grind — while you stay the one who says yes.*

— **Haflidi**, Microsoft
