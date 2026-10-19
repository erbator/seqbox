return {
  'sphamba/smear-cursor.nvim',
  opts = {
    -- equal head/tail stiffness moves the cursor as one block; low damping makes it overshoot and bounce
    stiffness = 0.7,
    trailing_stiffness = 0.7,
    damping = 0.65,
    stiffness_insert_mode = 0.7,
    trailing_stiffness_insert_mode = 0.7,
    damping_insert_mode = 0.65,
  },
}
