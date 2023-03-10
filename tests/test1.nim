import std/[unittest, strutils]
import iconim

const
  activityIcon = """<svg viewBox="0 0 24 24" width="20" stroke-width="2" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" height="20"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12" /></svg>"""
  calendarIcon = """<svg viewBox="0 0 24 24" width="20" stroke-width="2" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" height="20"><rect width="18" y="4" x="3" rx="2" height="18" ry="2" /><line x1="16" x2="16" y1="2" y2="6" /><line x1="8" x2="8" y1="2" y2="6" /><line x1="3" x2="21" y1="10" y2="10" /></svg>"""
  calendarIconResized = """<svg viewBox="0 0 24 24" width="48" stroke-width="2" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" height="48"><rect width="18" y="4" x="3" rx="2" height="18" ry="2" /><line x1="16" x2="16" y1="2" y2="6" /><line x1="8" x2="8" y1="2" y2="6" /><line x1="3" x2="21" y1="10" y2="10" /></svg>"""

Icon.init("./examples", default = "featherA", stripAttrs = @["class"])

test "can render":
  check($icon("activity") == activityIcon)

test "can render from a secondary library":
  check($icon("calendar", "featherB") == calendarIcon)

test "can change size on the fly":
  check($icon("calendar", "featherB").size(48) == calendarIconResized)

test "can iterate icons":
  for ico in Icon.items():
    check endsWith(ico.getPath(), ".svg")
