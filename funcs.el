(with-eval-after-load 'hydra
  (defhydra hydra-info (:hint nil)
    "
Info-mode:

  ^^_J_ scroll down ()or next node)        ^^_L_ history forward _u_p (↑)                             _f_ollow reference      _T_OC
  ^^_K_ scroll up (or next node)           ^^_H_ history back    _m_enu (↓) (C-u for new window)      _i_ndex                 _d_irectory
  ^^_]_ forward  (next logical node)       _<_/_t_op             _gt_ goto (C-u for new window)       _,_ next index item     _c_opy node name
  ^^_[_ backward (prev logical node)       ^^_>_ final           _gg_ beginning of buffer             virtual _I_ndex         _C_lone buffer
  regex _s_earch (_S_ case sensitive)      ^^ ^^                 _G_  end of buffer                   _o_ ace follow link     _a_propos

  _1_ .. _9_ Pick first .. ninth item in the node's menu.

"

    ("J"   Info-scroll-up)
    ("K"   Info-scroll-down)
    ("]"   Info-forward-node)
    ("["   Info-backward-node)
    ("s"   Info-search)
    ("S"   Info-search-case-sensitively)

    ("H"   Info-history-back)
    ("L"   Info-history-forward)
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
    ("h"   Info-help "Info help (for emacs state)")
    ("q"   Info-exit "Info exit")
    ("C-g" nil "cancel" :color blue)))
