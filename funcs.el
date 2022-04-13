(with-eval-after-load 'hydra
  (defhydra hydra-info (:hint nil)
    "
Info-mode:

  _J_/_K_ scroll down/up (or next/previous node)      _L_/_H_ history forward/back   _u_p (↑)                             _f_ollow reference      _T_OC
  _[_/_]_ backward/forward (prev/next logical node)  ^^_<tab>_ next reference        _m_enu (C-u for new window)          _i_ndex                 _d_irectory
  _j_/_k_ scroll line down/up                        _<_/_t_op                       _gt_ goto (C-u for new window)       _,_ next index item     _c_opy node name
  _h_/_l_ move left/right                            ^^_>_ final                     _gg_ beginning of buffer             virtual _I_ndex         _C_lone buffer
  regex _s_earch (_S_ case sensitive)                ^^ ^^                           _G_  end of buffer                   _o_ ace follow link     _a_propos

  _1_ .. _9_ Pick first .. ninth item in the node's menu.

"

    ("j"   evil-next-visual-line)
    ("k"   evil-previous-visual-line)
    ("l"   evil-forward-char)
    ("h"   evil-backward-char)
    ("J"   Info-scroll-up)
    ("K"   Info-scroll-down)
    ("]"   Info-forward-node)
    ("["   Info-backward-node)
    ("s"   Info-search)
    ("S"   Info-search-case-sensitively)

    ("H"   Info-history-back)
    ("L"   Info-history-forward)
    ("<tab>" Info-next-reference)
    ("t"   Info-top-node)
    ("<"   Info-top-node)
    (">"   Info-final-node)

    ("u"   Info-up)
    ("^"   Info-up)
    ("m"   Info-menu)
    ("gt"   Info-goto-node)
    ("gg"   beginning-of-buffer)
    ("G"   end-of-buffer)

    ("f"   Info-follow-reference)
    ("i"   Info-index)
    (","   Info-index-next)
    ("I"   Info-virtual-index)
    ("o"   ace-link-info)

    ("T"   Info-toc)
    ("d"   Info-directory)
    ("c"   Info-copy-current-node-name)
    ("C"   clone-buffer)
    ("a"   info-apropos)

    ("1"   Info-nth-menu-item)
    ("2"   Info-nth-menu-item)
    ("3"   Info-nth-menu-item)
    ("4"   Info-nth-menu-item)
    ("5"   Info-nth-menu-item)
    ("6"   Info-nth-menu-item)
    ("7"   Info-nth-menu-item)
    ("8"   Info-nth-menu-item)
    ("9"   Info-nth-menu-item)

    ("?"   Info-summary "Info summary")
    ("q"   Info-exit "Info exit")
    ("C-g" nil "cancel" :color blue)))
