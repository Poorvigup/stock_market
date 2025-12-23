class XgBoostModel {
  /// Predicts a score based on a list of RAW (un-normalized) input features.
  double score(List<double> input) {
    double var0;
    if (input[0] < 3761.5) {
        if (input[0] < 3322.6) {
            if (input[1] < 3136.4) {
                var0 = -40.673832;
            } else {
                if (input[1] < 3244.9) {
                    var0 = -28.321045;
                } else {
                    var0 = -17.491219;
                }
            }
        } else {
            if (input[2] < 3462.75) {
                if (input[1] < 3446.2) {
                    if (input[2] < 3387.7) {
                        var0 = -6.853105;
                    } else {
                        var0 = -2.7275026;
                    }
                } else {
                    if (input[2] < 3430.4) {
                        if (input[4] < 2845192.0) {
                            var0 = 0.098610274;
                        } else {
                            var0 = -1.7716715;
                        }
                    } else {
                        if (input[1] < 3473.0) {
                            var0 = -0.08449707;
                        } else {
                            var0 = 2.2852447;
                        }
                    }
                }
            } else {
                if (input[1] < 3578.95) {
                    var0 = 6.773749;
                } else {
                    var0 = 14.175262;
                }
            }
        }
    } else {
        if (input[0] < 4030.9) {
            var0 = 36.92514;
        } else {
            var0 = 69.31326;
        }
    }
    double var1;
    if (input[0] < 3761.5) {
        if (input[0] < 3322.6) {
            if (input[1] < 3122.7) {
                var1 = -37.279716;
            } else {
                if (input[1] < 3244.9) {
                    var1 = -26.145935;
                } else {
                    var1 = -15.867034;
                }
            }
        } else {
            if (input[2] < 3462.75) {
                if (input[1] < 3446.2) {
                    if (input[1] < 3412.5) {
                        var1 = -6.9088907;
                    } else {
                        if (input[4] < 1720835.0) {
                            var1 = -1.280835;
                        } else {
                            var1 = -3.5942628;
                        }
                    }
                } else {
                    if (input[2] < 3423.2) {
                        if (input[4] < 2845192.0) {
                            var1 = -0.13078836;
                        } else {
                            var1 = -1.8124659;
                        }
                    } else {
                        if (input[1] < 3477.8) {
                            var1 = 0.25024414;
                        } else {
                            var1 = 2.148874;
                        }
                    }
                }
            } else {
                if (input[1] < 3630.5) {
                    if (input[2] < 3498.3) {
                        var1 = 5.049665;
                    } else {
                        var1 = 8.82134;
                    }
                } else {
                    var1 = 15.097406;
                }
            }
        }
    } else {
        if (input[0] < 4018.4) {
            var1 = 31.32291;
        } else {
            var1 = 62.195965;
        }
    }
    double var2;
    if (input[0] < 3761.5) {
        if (input[0] < 3322.6) {
            if (input[1] < 3144.0) {
                var2 = -32.783207;
            } else {
                if (input[1] < 3244.9) {
                    var2 = -22.55265;
                } else {
                    var2 = -14.393676;
                }
            }
        } else {
            if (input[1] < 3520.0) {
                if (input[1] < 3446.2) {
                    if (input[0] < 3371.1) {
                        var2 = -8.141879;
                    } else {
                        if (input[4] < 1720835.0) {
                            var2 = -1.1954509;
                        } else {
                            var2 = -3.8904119;
                        }
                    }
                } else {
                    if (input[2] < 3423.2) {
                        if (input[4] < 2845192.0) {
                            var2 = -0.11889205;
                        } else {
                            var2 = -1.6674658;
                        }
                    } else {
                        if (input[1] < 3477.8) {
                            var2 = 0.23022461;
                        } else {
                            var2 = 1.7263079;
                        }
                    }
                }
            } else {
                if (input[1] < 3630.5) {
                    if (input[2] < 3508.6) {
                        var2 = 4.777311;
                    } else {
                        if (input[0] < 3600.0) {
                            var2 = 8.638753;
                        } else {
                            var2 = 2.460669;
                        }
                    }
                } else {
                    var2 = 13.776382;
                }
            }
        }
    } else {
        if (input[0] < 4030.9) {
            var2 = 30.634262;
        } else {
            var2 = 56.51777;
        }
    }
    double var3;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[1] < 3118.0) {
                var3 = -30.678686;
            } else {
                if (input[1] < 3244.9) {
                    var3 = -21.407257;
                } else {
                    var3 = -12.849818;
                }
            }
        } else {
            if (input[2] < 3462.75) {
                if (input[2] < 3405.0) {
                    if (input[1] < 3504.5) {
                        if (input[2] < 3390.1) {
                            var3 = -3.6765084;
                        } else {
                            var3 = -2.0086732;
                        }
                    } else {
                        var3 = 0.55305177;
                    }
                } else {
                    if (input[2] < 3430.4) {
                        if (input[0] < 3450.0) {
                            var3 = 0.34591064;
                        } else {
                            var3 = -0.6270403;
                        }
                    } else {
                        if (input[1] < 3473.0) {
                            var3 = -0.10429688;
                        } else {
                            var3 = 1.7505066;
                        }
                    }
                }
            } else {
                if (input[1] < 3578.95) {
                    var3 = 5.0271773;
                } else {
                    var3 = 10.73118;
                }
            }
        }
    } else {
        if (input[1] < 4160.6) {
            if (input[0] < 3856.5) {
                var3 = 16.068506;
            } else {
                var3 = 41.235046;
            }
        } else {
            var3 = 58.105877;
        }
    }
    double var4;
    if (input[1] < 3663.0) {
        if (input[3] < 3273.8) {
            if (input[2] < 3053.4) {
                var4 = -28.178944;
            } else {
                if (input[0] < 3194.0) {
                    var4 = -19.811964;
                } else {
                    var4 = -12.829709;
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[0] < 3371.1) {
                    var4 = -9.183942;
                } else {
                    if (input[1] < 3446.2) {
                        if (input[4] < 1720835.0) {
                            var4 = -0.98182786;
                        } else {
                            var4 = -3.2328346;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var4 = 0.2810346;
                        } else {
                            var4 = -1.3179444;
                        }
                    }
                }
            } else {
                if (input[2] < 3502.2) {
                    if (input[1] < 3509.9) {
                        var4 = 1.5049256;
                    } else {
                        var4 = 3.800244;
                    }
                } else {
                    var4 = 8.282583;
                }
            }
        }
    } else {
        if (input[1] < 3934.0) {
            var4 = 17.60033;
        } else {
            if (input[1] < 4256.45) {
                var4 = 39.797344;
            } else {
                var4 = 57.91792;
            }
        }
    }
    double var5;
    if (input[1] < 3710.0) {
        if (input[1] < 3349.0) {
            if (input[1] < 3103.4) {
                var5 = -25.465126;
            } else {
                if (input[1] < 3211.9) {
                    var5 = -17.94602;
                } else {
                    var5 = -11.268605;
                }
            }
        } else {
            if (input[1] < 3520.0) {
                if (input[1] < 3446.2) {
                    if (input[4] < 3404365.0) {
                        if (input[4] < 1720835.0) {
                            var5 = -0.91636556;
                        } else {
                            var5 = -2.7615454;
                        }
                    } else {
                        var5 = -5.6658874;
                    }
                } else {
                    if (input[2] < 3415.3) {
                        if (input[4] < 2845192.0) {
                            var5 = -0.29834595;
                        } else {
                            var5 = -2.0024498;
                        }
                    } else {
                        if (input[2] < 3430.4) {
                            var5 = 0.21941462;
                        } else {
                            var5 = 1.1333588;
                        }
                    }
                }
            } else {
                if (input[1] < 3630.5) {
                    if (input[2] < 3498.3) {
                        var5 = 3.2884827;
                    } else {
                        if (input[0] < 3600.0) {
                            var5 = 6.068791;
                        } else {
                            var5 = 1.3869507;
                        }
                    }
                } else {
                    var5 = 10.148075;
                }
            }
        }
    } else {
        if (input[2] < 4044.2) {
            if (input[0] < 3651.0) {
                var5 = 7.1789675;
            } else {
                var5 = 28.978285;
            }
        } else {
            var5 = 44.516678;
        }
    }
    double var6;
    if (input[1] < 3663.0) {
        if (input[1] < 3303.6) {
            if (input[1] < 3066.0) {
                var6 = -24.728806;
            } else {
                if (input[1] < 3178.0) {
                    var6 = -17.590023;
                } else {
                    var6 = -11.89493;
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[0] < 3371.1) {
                    var6 = -7.283179;
                } else {
                    if (input[1] < 3446.2) {
                        if (input[4] < 1720835.0) {
                            var6 = -0.85528153;
                        } else {
                            var6 = -2.661488;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var6 = 0.2337503;
                        } else {
                            var6 = -1.1523479;
                        }
                    }
                }
            } else {
                if (input[2] < 3502.2) {
                    if (input[2] < 3462.75) {
                        var6 = 1.493833;
                    } else {
                        var6 = 3.1981323;
                    }
                } else {
                    if (input[1] < 3630.5) {
                        if (input[0] < 3600.0) {
                            var6 = 5.579601;
                        } else {
                            var6 = 1.3176025;
                        }
                    } else {
                        var6 = 8.709916;
                    }
                }
            }
        }
    } else {
        if (input[1] < 4180.95) {
            if (input[0] < 3856.5) {
                var6 = 12.400845;
            } else {
                var6 = 30.975641;
            }
        } else {
            var6 = 45.961662;
        }
    }
    double var7;
    if (input[1] < 3710.0) {
        if (input[3] < 3273.8) {
            if (input[1] < 3066.0) {
                var7 = -22.341202;
            } else {
                if (input[1] < 3180.5) {
                    var7 = -15.752695;
                } else {
                    var7 = -10.641135;
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[0] < 3371.1) {
                    var7 = -6.7818513;
                } else {
                    if (input[2] < 3405.0) {
                        if (input[1] < 3504.5) {
                            var7 = -2.1525514;
                        } else {
                            var7 = 0.5145874;
                        }
                    } else {
                        if (input[2] < 3415.3) {
                            var7 = -0.5526693;
                        } else {
                            var7 = 0.38306794;
                        }
                    }
                }
            } else {
                if (input[2] < 3502.2) {
                    if (input[1] < 3509.9) {
                        var7 = 1.1950196;
                    } else {
                        var7 = 2.8423886;
                    }
                } else {
                    if (input[1] < 3630.5) {
                        if (input[0] < 3600.0) {
                            var7 = 5.0723658;
                        } else {
                            var7 = 1.2517213;
                        }
                    } else {
                        var7 = 8.478934;
                    }
                }
            }
        }
    } else {
        if (input[1] < 4256.45) {
            if (input[0] < 3856.5) {
                var7 = 11.398963;
            } else {
                var7 = 28.80545;
            }
        } else {
            var7 = 44.562263;
        }
    }
    double var8;
    if (input[1] < 3663.0) {
        if (input[3] < 3273.8) {
            if (input[1] < 3043.0) {
                var8 = -21.784674;
            } else {
                if (input[1] < 3162.0) {
                    var8 = -15.08174;
                } else {
                    var8 = -10.229362;
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[0] < 3371.1) {
                    var8 = -6.1884494;
                } else {
                    if (input[1] < 3446.2) {
                        if (input[4] < 1720835.0) {
                            var8 = -0.6547608;
                        } else {
                            var8 = -2.2238548;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var8 = 0.21737276;
                        } else {
                            var8 = -1.0037191;
                        }
                    }
                }
            } else {
                if (input[2] < 3498.3) {
                    if (input[4] < 3198036.0) {
                        var8 = 2.4747498;
                    } else {
                        var8 = 1.0236939;
                    }
                } else {
                    if (input[1] < 3551.0) {
                        var8 = 2.6888611;
                    } else {
                        var8 = 6.012113;
                    }
                }
            }
        }
    } else {
        if (input[1] < 4256.45) {
            if (input[0] < 3925.0) {
                var8 = 12.924739;
            } else {
                var8 = 26.492691;
            }
        } else {
            var8 = 40.55166;
        }
    }
    double var9;
    if (input[1] < 3710.0) {
        if (input[0] < 3371.1) {
            if (input[1] < 3069.0) {
                var9 = -18.113104;
            } else {
                if (input[1] < 3244.9) {
                    var9 = -12.296069;
                } else {
                    var9 = -7.0623;
                }
            }
        } else {
            if (input[2] < 3464.3) {
                if (input[2] < 3415.3) {
                    if (input[1] < 3446.2) {
                        if (input[2] < 3387.7) {
                            var9 = -2.250531;
                        } else {
                            var9 = -1.0112671;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var9 = -0.25667724;
                        } else {
                            var9 = -1.5817139;
                        }
                    }
                } else {
                    if (input[2] < 3449.1) {
                        if (input[4] < 2880121.0) {
                            var9 = 0.55271;
                        } else {
                            var9 = -0.48468423;
                        }
                    } else {
                        var9 = 1.2061604;
                    }
                }
            } else {
                if (input[1] < 3609.45) {
                    if (input[4] < 3584683.0) {
                        var9 = 3.3058953;
                    } else {
                        var9 = 0.7239624;
                    }
                } else {
                    var9 = 6.6984916;
                }
            }
        }
    } else {
        if (input[1] < 4180.95) {
            if (input[0] < 3856.5) {
                var9 = 9.574683;
            } else {
                var9 = 22.753307;
            }
        } else {
            var9 = 34.64223;
        }
    }
    double var10;
    if (input[2] < 3610.5) {
        if (input[1] < 3303.6) {
            if (input[1] < 3043.0) {
                var10 = -18.004889;
            } else {
                if (input[1] < 3162.0) {
                    var10 = -12.251719;
                } else {
                    if (input[2] < 3229.0) {
                        var10 = -8.377901;
                    } else {
                        var10 = -2.2231324;
                    }
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[1] < 3412.5) {
                    if (input[0] < 3371.1) {
                        var10 = -4.828976;
                    } else {
                        var10 = -2.0721924;
                    }
                } else {
                    if (input[2] < 3415.3) {
                        if (input[1] < 3504.5) {
                            var10 = -1.1125977;
                        } else {
                            var10 = 0.49082032;
                        }
                    } else {
                        if (input[4] < 2880121.0) {
                            var10 = 0.5024614;
                        } else {
                            var10 = -0.45237634;
                        }
                    }
                }
            } else {
                if (input[2] < 3498.3) {
                    if (input[1] < 3509.9) {
                        if (input[1] < 3502.0) {
                            var10 = 0.98273116;
                        } else {
                            var10 = 0.2571045;
                        }
                    } else {
                        var10 = 1.9983155;
                    }
                } else {
                    if (input[1] < 3551.0) {
                        var10 = 2.2392457;
                    } else {
                        var10 = 4.7354703;
                    }
                }
            }
        }
    } else {
        if (input[2] < 4041.05) {
            if (input[0] < 3651.0) {
                var10 = 6.5282106;
            } else {
                var10 = 16.691608;
            }
        } else {
            if (input[1] < 4297.0) {
                var10 = 23.090437;
            } else {
                var10 = 35.45838;
            }
        }
    }
    double var11;
    if (input[2] < 3610.5) {
        if (input[3] < 3273.8) {
            if (input[2] < 2978.5) {
                var11 = -17.339342;
            } else {
                if (input[1] < 3162.0) {
                    var11 = -11.281956;
                } else {
                    var11 = -7.5317836;
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[1] < 3412.5) {
                    if (input[0] < 3371.1) {
                        var11 = -4.5177584;
                    } else {
                        var11 = -1.9064112;
                    }
                } else {
                    if (input[2] < 3415.3) {
                        if (input[1] < 3504.5) {
                            var11 = -1.0078872;
                        } else {
                            var11 = 0.4662842;
                        }
                    } else {
                        if (input[0] < 3470.0) {
                            var11 = 0.49947998;
                        } else {
                            var11 = -0.3092041;
                        }
                    }
                }
            } else {
                if (input[2] < 3498.3) {
                    if (input[4] < 3177741.0) {
                        if (input[3] < 3497.1) {
                            var11 = 2.3435986;
                        } else {
                            var11 = 1.2825335;
                        }
                    } else {
                        if (input[1] < 3509.9) {
                            var11 = 0.24425049;
                        } else {
                            var11 = 0.9593994;
                        }
                    }
                } else {
                    if (input[1] < 3630.5) {
                        if (input[0] < 3600.0) {
                            var11 = 3.403465;
                        } else {
                            var11 = 0.3168335;
                        }
                    } else {
                        var11 = 5.390117;
                    }
                }
            }
        }
    } else {
        if (input[1] < 4297.0) {
            if (input[0] < 3925.0) {
                var11 = 9.306891;
            } else {
                var11 = 19.881407;
            }
        } else {
            var11 = 32.355762;
        }
    }
    double var12;
    if (input[1] < 3710.0) {
        if (input[1] < 3278.1) {
            if (input[2] < 2968.0) {
                var12 = -16.301693;
            } else {
                if (input[2] < 3117.0) {
                    var12 = -10.415913;
                } else {
                    var12 = -7.3726287;
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[0] < 3371.1) {
                    var12 = -4.273579;
                } else {
                    if (input[2] < 3405.0) {
                        if (input[1] < 3504.5) {
                            var12 = -1.3957016;
                        } else {
                            var12 = 0.44296876;
                        }
                    } else {
                        if (input[1] < 3451.4) {
                            var12 = -0.6768229;
                        } else {
                            var12 = 0.21698914;
                        }
                    }
                }
            } else {
                if (input[1] < 3609.45) {
                    if (input[2] < 3464.3) {
                        var12 = 0.9001384;
                    } else {
                        if (input[1] < 3535.0) {
                            var12 = 1.2266749;
                        } else {
                            var12 = 2.594191;
                        }
                    }
                } else {
                    var12 = 5.1545873;
                }
            }
        }
    } else {
        if (input[2] < 4207.45) {
            if (input[0] < 4030.9) {
                var12 = 10.162585;
            } else {
                var12 = 18.213247;
            }
        } else {
            var12 = 29.634546;
        }
    }
    double var13;
    if (input[2] < 3610.5) {
        if (input[3] < 3273.8) {
            if (input[1] < 3043.0) {
                var13 = -13.52024;
            } else {
                if (input[1] < 3178.0) {
                    var13 = -8.87669;
                } else {
                    var13 = -5.891786;
                }
            }
        } else {
            if (input[2] < 3449.1) {
                if (input[1] < 3412.5) {
                    if (input[0] < 3371.1) {
                        if (input[3] < 3274.05) {
                            var13 = -1.0950073;
                        } else {
                            var13 = -3.926873;
                        }
                    } else {
                        var13 = -1.6422313;
                    }
                } else {
                    if (input[2] < 3415.3) {
                        if (input[1] < 3504.5) {
                            var13 = -0.81858915;
                        } else {
                            var13 = 0.4208252;
                        }
                    } else {
                        if (input[4] < 2880121.0) {
                            var13 = 0.3989968;
                        } else {
                            var13 = -0.4160807;
                        }
                    }
                }
            } else {
                if (input[2] < 3498.3) {
                    if (input[3] < 3497.1) {
                        if (input[4] < 2802055.0) {
                            var13 = 2.313153;
                        } else {
                            var13 = 0.5845215;
                        }
                    } else {
                        var13 = 0.9758692;
                    }
                } else {
                    if (input[2] < 3536.1) {
                        if (input[3] < 3552.45) {
                            var13 = 3.0178764;
                        } else {
                            var13 = 0.8207459;
                        }
                    } else {
                        var13 = 4.3938885;
                    }
                }
            }
        }
    } else {
        if (input[1] < 4163.15) {
            if (input[0] < 3856.5) {
                var13 = 6.4165163;
            } else {
                var13 = 14.624904;
            }
        } else {
            var13 = 23.110678;
        }
    }
    double var14;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[1] < 3076.0) {
                if (input[2] < 2960.5) {
                    var14 = -13.85786;
                } else {
                    var14 = -9.17674;
                }
            } else {
                if (input[3] < 3209.2) {
                    var14 = -7.206273;
                } else {
                    if (input[4] < 2392472.0) {
                        var14 = -1.2271118;
                    } else {
                        var14 = -4.3409705;
                    }
                }
            }
        } else {
            if (input[2] < 3464.3) {
                if (input[2] < 3405.0) {
                    if (input[1] < 3504.5) {
                        if (input[2] < 3387.7) {
                            var14 = -1.5402192;
                        } else {
                            var14 = -0.70649415;
                        }
                    } else {
                        var14 = 0.39978027;
                    }
                } else {
                    if (input[2] < 3423.2) {
                        if (input[0] < 3446.0) {
                            var14 = 0.19431153;
                        } else {
                            var14 = -0.4709188;
                        }
                    } else {
                        if (input[1] < 3477.8) {
                            var14 = 0.023969727;
                        } else {
                            var14 = 0.8207221;
                        }
                    }
                }
            } else {
                if (input[1] < 3630.5) {
                    if (input[0] < 3600.0) {
                        if (input[2] < 3508.6) {
                            var14 = 1.5061971;
                        } else {
                            var14 = 2.7331982;
                        }
                    } else {
                        var14 = 0.0022216798;
                    }
                } else {
                    var14 = 4.8128695;
                }
            }
        }
    } else {
        if (input[0] < 4311.7) {
            if (input[2] < 4017.75) {
                var14 = 9.933343;
            } else {
                var14 = 15.5004835;
            }
        } else {
            var14 = 26.841257;
        }
    }
    double var15;
    if (input[2] < 3610.5) {
        if (input[1] < 3278.1) {
            if (input[2] < 2960.5) {
                var15 = -12.598049;
            } else {
                if (input[1] < 3122.7) {
                    if (input[4] < 4901694.0) {
                        var15 = -8.094272;
                    } else {
                        var15 = -2.2947998;
                    }
                } else {
                    var15 = -5.794358;
                }
            }
        } else {
            if (input[2] < 3423.2) {
                if (input[0] < 3371.1) {
                    if (input[4] < 2934778.0) {
                        var15 = -1.5939881;
                    } else {
                        var15 = -3.5825055;
                    }
                } else {
                    if (input[1] < 3425.0) {
                        if (input[2] < 3382.0) {
                            var15 = -1.4866537;
                        } else {
                            var15 = -0.41082764;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var15 = -0.12483887;
                        } else {
                            var15 = -0.88347864;
                        }
                    }
                }
            } else {
                if (input[2] < 3498.3) {
                    if (input[1] < 3477.8) {
                        if (input[2] < 3437.0) {
                            var15 = -0.17870484;
                        } else {
                            var15 = 0.41254884;
                        }
                    } else {
                        if (input[0] < 3455.0) {
                            var15 = 0.32744953;
                        } else {
                            var15 = 1.1853622;
                        }
                    }
                } else {
                    if (input[1] < 3600.0) {
                        var15 = 1.8597739;
                    } else {
                        if (input[0] < 3614.85) {
                            var15 = 3.8349855;
                        } else {
                            var15 = 1.226823;
                        }
                    }
                }
            }
        }
    } else {
        if (input[1] < 4297.0) {
            if (input[1] < 3934.0) {
                var15 = 5.801971;
            } else {
                var15 = 13.047215;
            }
        } else {
            var15 = 22.987127;
        }
    }
    double var16;
    if (input[1] < 3630.5) {
        if (input[1] < 3278.1) {
            if (input[2] < 2960.5) {
                var16 = -11.452764;
            } else {
                if (input[1] < 3152.0) {
                    var16 = -6.9792314;
                } else {
                    var16 = -4.8261657;
                }
            }
        } else {
            if (input[2] < 3415.3) {
                if (input[0] < 3371.1) {
                    if (input[4] < 2934778.0) {
                        var16 = -1.4744385;
                    } else {
                        var16 = -3.2754326;
                    }
                } else {
                    if (input[4] < 2845192.0) {
                        if (input[4] < 2684318.0) {
                            var16 = -0.64326173;
                        } else {
                            var16 = 0.5254639;
                        }
                    } else {
                        var16 = -1.2881801;
                    }
                }
            } else {
                if (input[2] < 3464.3) {
                    if (input[1] < 3495.0) {
                        if (input[4] < 2880121.0) {
                            var16 = 0.2925;
                        } else {
                            var16 = -0.3380371;
                        }
                    } else {
                        if (input[0] < 3455.0) {
                            var16 = -0.09840088;
                        } else {
                            var16 = 0.74982095;
                        }
                    }
                } else {
                    if (input[0] < 3600.0) {
                        if (input[1] < 3551.0) {
                            var16 = 1.1265112;
                        } else {
                            var16 = 2.1932943;
                        }
                    } else {
                        var16 = -0.059228517;
                    }
                }
            }
        }
    } else {
        if (input[2] < 4044.2) {
            if (input[0] < 3761.5) {
                var16 = 4.015012;
            } else {
                var16 = 8.923007;
            }
        } else {
            if (input[0] < 4311.7) {
                var16 = 13.07125;
            } else {
                var16 = 22.688892;
            }
        }
    }
    double var17;
    if (input[1] < 3630.5) {
        if (input[3] < 3273.8) {
            if (input[2] < 2960.5) {
                var17 = -10.4115925;
            } else {
                if (input[2] < 3117.0) {
                    if (input[4] < 4901694.0) {
                        var17 = -6.3590136;
                    } else {
                        var17 = -1.8310913;
                    }
                } else {
                    var17 = -4.2683935;
                }
            }
        } else {
            if (input[2] < 3415.3) {
                if (input[1] < 3412.5) {
                    if (input[0] < 3371.1) {
                        if (input[3] < 3274.05) {
                            var17 = -0.6697876;
                        } else {
                            var17 = -2.6307652;
                        }
                    } else {
                        var17 = -1.1914405;
                    }
                } else {
                    if (input[4] < 2845192.0) {
                        if (input[4] < 2684318.0) {
                            var17 = -0.4650879;
                        } else {
                            var17 = 0.49043784;
                        }
                    } else {
                        var17 = -0.97510254;
                    }
                }
            } else {
                if (input[2] < 3464.3) {
                    if (input[1] < 3495.0) {
                        if (input[4] < 2880121.0) {
                            var17 = 0.26617676;
                        } else {
                            var17 = -0.3154948;
                        }
                    } else {
                        if (input[0] < 3455.0) {
                            var17 = -0.093481444;
                        } else {
                            var17 = 0.68734133;
                        }
                    }
                } else {
                    if (input[0] < 3600.0) {
                        if (input[1] < 3551.0) {
                            var17 = 1.0251294;
                        } else {
                            var17 = 1.9922364;
                        }
                    } else {
                        var17 = -0.056262206;
                    }
                }
            }
        }
    } else {
        if (input[2] < 4096.95) {
            if (input[0] < 3856.5) {
                var17 = 4.2278666;
            } else {
                var17 = 9.721605;
            }
        } else {
            if (input[0] < 4311.7) {
                var17 = 12.321331;
            } else {
                var17 = 20.798145;
            }
        }
    }
    double var18;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[1] < 3074.0) {
                if (input[1] < 2975.0) {
                    var18 = -11.556069;
                } else {
                    var18 = -6.5822334;
                }
            } else {
                if (input[1] < 3203.0) {
                    var18 = -4.846213;
                } else {
                    if (input[4] < 2392472.0) {
                        var18 = -0.7989258;
                    } else {
                        var18 = -3.0074952;
                    }
                }
            }
        } else {
            if (input[1] < 3535.0) {
                if (input[2] < 3415.3) {
                    if (input[1] < 3425.0) {
                        if (input[2] < 3382.0) {
                            var18 = -1.2004924;
                        } else {
                            var18 = -0.33486328;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var18 = -0.108683266;
                        } else {
                            var18 = -0.8970947;
                        }
                    }
                } else {
                    if (input[0] < 3491.0) {
                        if (input[4] < 2880121.0) {
                            var18 = 0.31099573;
                        } else {
                            var18 = -0.10737305;
                        }
                    } else {
                        if (input[1] < 3523.25) {
                            var18 = 0.9651448;
                        } else {
                            var18 = 0.23845215;
                        }
                    }
                }
            } else {
                if (input[2] < 3536.1) {
                    if (input[3] < 3518.8) {
                        var18 = 2.0776613;
                    } else {
                        if (input[2] < 3512.0) {
                            var18 = 0.4109192;
                        } else {
                            var18 = 1.3004639;
                        }
                    }
                } else {
                    if (input[1] < 3600.0) {
                        var18 = 0.8958374;
                    } else {
                        var18 = 3.4185028;
                    }
                }
            }
        }
    } else {
        if (input[0] < 4311.7) {
            if (input[2] < 4017.75) {
                var18 = 6.4467134;
            } else {
                var18 = 10.460016;
            }
        } else {
            var18 = 19.064949;
        }
    }
    double var19;
    if (input[1] < 3630.5) {
        if (input[3] < 3273.8) {
            if (input[1] < 2975.0) {
                var19 = -10.6315775;
            } else {
                if (input[2] < 3053.4) {
                    var19 = -5.755741;
                } else {
                    if (input[2] < 3206.0) {
                        var19 = -4.0329123;
                    } else {
                        var19 = -2.4002721;
                    }
                }
            }
        } else {
            if (input[2] < 3423.2) {
                if (input[1] < 3425.0) {
                    if (input[4] < 2934778.0) {
                        var19 = -0.97823316;
                    } else {
                        var19 = -2.0494354;
                    }
                } else {
                    if (input[4] < 2880121.0) {
                        if (input[3] < 3462.9) {
                            var19 = -0.1924642;
                        } else {
                            var19 = 0.36075032;
                        }
                    } else {
                        var19 = -0.72823733;
                    }
                }
            } else {
                if (input[2] < 3512.0) {
                    if (input[1] < 3477.8) {
                        if (input[2] < 3437.0) {
                            var19 = -0.1897583;
                        } else {
                            var19 = 0.34843752;
                        }
                    } else {
                        if (input[4] < 2802055.0) {
                            var19 = 1.0377555;
                        } else {
                            var19 = 0.37761503;
                        }
                    }
                } else {
                    if (input[4] < 2626187.0) {
                        if (input[0] < 3521.0) {
                            var19 = 0.08835449;
                        } else {
                            var19 = 1.0114502;
                        }
                    } else {
                        var19 = 2.513806;
                    }
                }
            }
        }
    } else {
        if (input[2] < 4207.45) {
            if (input[0] < 4030.9) {
                var19 = 4.2259803;
            } else {
                var19 = 8.960002;
            }
        } else {
            var19 = 16.261305;
        }
    }
    double var20;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[2] < 3010.9) {
                if (input[1] < 2975.0) {
                    var20 = -9.781051;
                } else {
                    if (input[1] < 3059.8) {
                        var20 = -5.778167;
                    } else {
                        var20 = -1.527124;
                    }
                }
            } else {
                if (input[1] < 3180.5) {
                    if (input[0] < 3011.2) {
                        var20 = -1.209436;
                    } else {
                        var20 = -4.2568755;
                    }
                } else {
                    if (input[4] < 2934778.0) {
                        if (input[1] < 3250.0) {
                            var20 = -2.1754835;
                        } else {
                            var20 = -0.95930666;
                        }
                    } else {
                        if (input[0] < 3102.0) {
                            var20 = -0.78878176;
                        } else {
                            var20 = -2.945677;
                        }
                    }
                }
            }
        } else {
            if (input[1] < 3535.0) {
                if (input[2] < 3398.1) {
                    if (input[1] < 3504.5) {
                        if (input[4] < 1720835.0) {
                            var20 = -0.10533041;
                        } else {
                            var20 = -0.8693828;
                        }
                    } else {
                        var20 = 0.32263184;
                    }
                } else {
                    if (input[2] < 3423.2) {
                        if (input[0] < 3446.0) {
                            var20 = 0.300572;
                        } else {
                            var20 = -0.48512837;
                        }
                    } else {
                        if (input[1] < 3473.0) {
                            var20 = -0.34628907;
                        } else {
                            var20 = 0.45762244;
                        }
                    }
                }
            } else {
                if (input[2] < 3536.1) {
                    if (input[3] < 3518.8) {
                        var20 = 1.746753;
                    } else {
                        if (input[2] < 3512.0) {
                            var20 = 0.31716308;
                        } else {
                            var20 = 1.103916;
                        }
                    }
                } else {
                    var20 = 2.6410022;
                }
            }
        }
    } else {
        if (input[0] < 4311.7) {
            if (input[2] < 4044.2) {
                var20 = 5.8514605;
            } else {
                var20 = 8.8569765;
            }
        } else {
            var20 = 16.121101;
        }
    }
    double var21;
    if (input[0] < 3761.5) {
        if (input[1] < 3349.0) {
            if (input[2] < 3010.9) {
                if (input[1] < 2975.0) {
                    var21 = -8.9985695;
                } else {
                    if (input[1] < 3059.8) {
                        var21 = -5.234348;
                    } else {
                        var21 = -1.4507691;
                    }
                }
            } else {
                if (input[1] < 3178.0) {
                    var21 = -3.8398762;
                } else {
                    if (input[4] < 2934778.0) {
                        if (input[1] < 3250.0) {
                            var21 = -2.1533122;
                        } else {
                            var21 = -0.88256836;
                        }
                    } else {
                        if (input[0] < 3102.0) {
                            var21 = -0.74934083;
                        } else {
                            var21 = -2.8595645;
                        }
                    }
                }
            }
        } else {
            if (input[1] < 3509.9) {
                if (input[2] < 3398.1) {
                    if (input[4] < 1720835.0) {
                        if (input[0] < 3401.1) {
                            var21 = -0.021240234;
                        } else {
                            var21 = -0.1262329;
                        }
                    } else {
                        if (input[4] < 3404365.0) {
                            var21 = -0.6674463;
                        } else {
                            var21 = -1.2560743;
                        }
                    }
                } else {
                    if (input[0] < 3446.0) {
                        if (input[4] < 2375183.0) {
                            var21 = -0.000982666;
                        } else {
                            var21 = 0.5609571;
                        }
                    } else {
                        if (input[2] < 3415.3) {
                            var21 = -0.74027103;
                        } else {
                            var21 = 0.116868235;
                        }
                    }
                }
            } else {
                if (input[1] < 3609.45) {
                    if (input[1] < 3600.35) {
                        if (input[1] < 3551.0) {
                            var21 = 0.678302;
                        } else {
                            var21 = 1.2275013;
                        }
                    } else {
                        var21 = 0.028735353;
                    }
                } else {
                    if (input[2] < 3512.0) {
                        if (input[0] < 3508.0) {
                            var21 = 1.6130127;
                        } else {
                            var21 = -0.10874023;
                        }
                    } else {
                        var21 = 2.539911;
                    }
                }
            }
        }
    } else {
        if (input[0] < 4311.7) {
            if (input[1] < 4118.85) {
                var21 = 5.003675;
            } else {
                if (input[2] < 4014.35) {
                    var21 = 2.3075197;
                } else {
                    var21 = 7.976336;
                }
            }
        } else {
            var21 = 14.7776785;
        }
    }
    double var22;
    if (input[0] < 3761.5) {
        if (input[1] < 3349.0) {
            if (input[2] < 2968.0) {
                if (input[1] < 2975.0) {
                    var22 = -8.278687;
                } else {
                    var22 = -4.6636047;
                }
            } else {
                if (input[1] < 3122.7) {
                    if (input[4] < 4901694.0) {
                        var22 = -4.028212;
                    } else {
                        var22 = -0.9569702;
                    }
                } else {
                    if (input[2] < 3218.0) {
                        if (input[0] < 3102.0) {
                            var22 = -1.5766927;
                        } else {
                            var22 = -2.905027;
                        }
                    } else {
                        if (input[2] < 3220.6) {
                            var22 = -0.3449219;
                        } else {
                            var22 = -1.7501081;
                        }
                    }
                }
            }
        } else {
            if (input[1] < 3509.9) {
                if (input[2] < 3398.1) {
                    if (input[4] < 1720835.0) {
                        if (input[0] < 3401.1) {
                            var22 = -0.020178223;
                        } else {
                            var22 = -0.11992188;
                        }
                    } else {
                        if (input[4] < 3404365.0) {
                            var22 = -0.60737306;
                        } else {
                            var22 = -1.155586;
                        }
                    }
                } else {
                    if (input[0] < 3446.0) {
                        if (input[4] < 2375183.0) {
                            var22 = -0.00090942386;
                        } else {
                            var22 = 0.51607424;
                        }
                    } else {
                        if (input[2] < 3415.3) {
                            var22 = -0.6847534;
                        } else {
                            var22 = 0.10607346;
                        }
                    }
                }
            } else {
                if (input[1] < 3609.45) {
                    if (input[1] < 3600.35) {
                        if (input[2] < 3508.6) {
                            var22 = 0.6668392;
                        } else {
                            var22 = 1.2082459;
                        }
                    } else {
                        var22 = 0.027294923;
                    }
                } else {
                    var22 = 2.1399536;
                }
            }
        }
    } else {
        if (input[0] < 4430.05) {
            if (input[2] < 4044.2) {
                var22 = 4.794896;
            } else {
                var22 = 7.486973;
            }
        } else {
            var22 = 15.269324;
        }
    }
    double var23;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[2] < 3010.9) {
                if (input[1] < 2975.0) {
                    var23 = -7.616382;
                } else {
                    if (input[1] < 3059.8) {
                        var23 = -4.336407;
                    } else {
                        var23 = -1.1768188;
                    }
                }
            } else {
                if (input[1] < 3180.5) {
                    if (input[4] < 4901694.0) {
                        var23 = -3.1633673;
                    } else {
                        var23 = -1.2528076;
                    }
                } else {
                    if (input[4] < 2934778.0) {
                        if (input[1] < 3250.0) {
                            var23 = -1.619873;
                        } else {
                            var23 = -0.6769629;
                        }
                    } else {
                        if (input[0] < 3102.0) {
                            var23 = -0.6330444;
                        } else {
                            var23 = -2.2095232;
                        }
                    }
                }
            }
        } else {
            if (input[1] < 3535.0) {
                if (input[2] < 3415.3) {
                    if (input[1] < 3425.0) {
                        if (input[2] < 3382.0) {
                            var23 = -0.7855957;
                        } else {
                            var23 = -0.1619873;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var23 = -0.055808514;
                        } else {
                            var23 = -0.58818847;
                        }
                    }
                } else {
                    if (input[0] < 3491.0) {
                        if (input[4] < 2880121.0) {
                            var23 = 0.18959586;
                        } else {
                            var23 = -0.1535498;
                        }
                    } else {
                        if (input[1] < 3523.25) {
                            var23 = 0.74885255;
                        } else {
                            var23 = 0.11751709;
                        }
                    }
                }
            } else {
                if (input[2] < 3536.1) {
                    if (input[3] < 3518.8) {
                        var23 = 1.4052155;
                    } else {
                        if (input[4] < 3177741.0) {
                            var23 = 0.21690674;
                        } else {
                            var23 = 1.1043214;
                        }
                    }
                } else {
                    if (input[1] < 3600.0) {
                        var23 = 0.54663086;
                    } else {
                        if (input[0] < 3651.0) {
                            var23 = 2.2586775;
                        } else {
                            var23 = 0.6163818;
                        }
                    }
                }
            }
        }
    } else {
        if (input[0] < 4430.05) {
            if (input[1] < 4118.85) {
                var23 = 4.0784817;
            } else {
                if (input[4] < 763161.0) {
                    var23 = 1.8432983;
                } else {
                    if (input[2] < 4014.35) {
                        var23 = 1.9523926;
                    } else {
                        var23 = 6.8507624;
                    }
                }
            }
        } else {
            var23 = 14.124109;
        }
    }
    double var24;
    if (input[0] < 3761.5) {
        if (input[1] < 3349.0) {
            if (input[2] < 2960.5) {
                if (input[1] < 2975.0) {
                    var24 = -7.007066;
                } else {
                    var24 = -3.8464565;
                }
            } else {
                if (input[2] < 3052.0) {
                    if (input[4] < 4901694.0) {
                        var24 = -3.4679234;
                    } else {
                        var24 = -0.84648436;
                    }
                } else {
                    if (input[2] < 3218.0) {
                        if (input[3] < 3299.4) {
                            var24 = -2.3510356;
                        } else {
                            var24 = -0.6013916;
                        }
                    } else {
                        if (input[2] < 3220.6) {
                            var24 = -0.29382324;
                        } else {
                            var24 = -1.4629325;
                        }
                    }
                }
            }
        } else {
            if (input[2] < 3464.3) {
                if (input[1] < 3425.0) {
                    if (input[1] < 3394.8) {
                        var24 = -0.26880696;
                    } else {
                        if (input[2] < 3382.0) {
                            var24 = -1.0114461;
                        } else {
                            var24 = -0.15388183;
                        }
                    }
                } else {
                    if (input[2] < 3423.2) {
                        if (input[4] < 2845192.0) {
                            var24 = -0.03335775;
                        } else {
                            var24 = -0.42901787;
                        }
                    } else {
                        if (input[1] < 3473.0) {
                            var24 = -0.34960938;
                        } else {
                            var24 = 0.29673666;
                        }
                    }
                }
            } else {
                if (input[1] < 3600.0) {
                    if (input[3] < 3497.7) {
                        if (input[4] < 2847013.0) {
                            var24 = 1.1931592;
                        } else {
                            var24 = 0.111218266;
                        }
                    } else {
                        if (input[2] < 3498.3) {
                            var24 = 0.10972086;
                        } else {
                            var24 = 0.7063751;
                        }
                    }
                } else {
                    if (input[0] < 3620.4) {
                        var24 = 1.9581391;
                    } else {
                        if (input[0] < 3625.0) {
                            var24 = -0.22114258;
                        } else {
                            var24 = 1.3619385;
                        }
                    }
                }
            }
        }
    } else {
        if (input[0] < 4430.05) {
            if (input[2] < 4044.2) {
                var24 = 3.9243286;
            } else {
                if (input[4] < 763161.0) {
                    var24 = 1.7511352;
                } else {
                    var24 = 6.2516418;
                }
            }
        } else {
            var24 = 13.064807;
        }
    }
    double var25;
    if (input[1] < 3630.5) {
        if (input[1] < 3349.0) {
            if (input[2] < 2960.5) {
                if (input[1] < 2975.0) {
                    var25 = -6.446499;
                } else {
                    var25 = -3.5167623;
                }
            } else {
                if (input[2] < 3052.0) {
                    if (input[4] < 4901694.0) {
                        var25 = -3.1326816;
                    } else {
                        var25 = -0.8041626;
                    }
                } else {
                    if (input[1] < 3203.0) {
                        if (input[3] < 3063.9) {
                            var25 = -1.147754;
                        } else {
                            var25 = -2.29516;
                        }
                    } else {
                        if (input[4] < 2934778.0) {
                            var25 = -0.9012451;
                        } else {
                            var25 = -1.7677025;
                        }
                    }
                }
            }
        } else {
            if (input[1] < 3509.9) {
                if (input[2] < 3398.1) {
                    if (input[4] < 3404365.0) {
                        if (input[4] < 1720835.0) {
                            var25 = -0.08277181;
                        } else {
                            var25 = -0.46295902;
                        }
                    } else {
                        if (input[0] < 3314.4) {
                            var25 = -0.14019775;
                        } else {
                            var25 = -1.0459961;
                        }
                    }
                } else {
                    if (input[0] < 3446.0) {
                        if (input[4] < 2375183.0) {
                            var25 = -0.0002746582;
                        } else {
                            var25 = 0.47341797;
                        }
                    } else {
                        if (input[2] < 3415.3) {
                            var25 = -0.6034973;
                        } else {
                            var25 = 0.07065242;
                        }
                    }
                }
            } else {
                if (input[2] < 3512.0) {
                    if (input[0] < 3531.8) {
                        if (input[4] < 2802055.0) {
                            var25 = 0.92631835;
                        } else {
                            var25 = 0.227771;
                        }
                    } else {
                        if (input[2] < 3488.1) {
                            var25 = 0.2706494;
                        } else {
                            var25 = -0.14851685;
                        }
                    }
                } else {
                    if (input[4] < 2626187.0) {
                        if (input[0] < 3521.0) {
                            var25 = -0.08282471;
                        } else {
                            var25 = 0.5541992;
                        }
                    } else {
                        if (input[0] < 3520.85) {
                            var25 = 0.48850098;
                        } else {
                            var25 = 1.943978;
                        }
                    }
                }
            }
        }
    } else {
        if (input[0] < 4311.7) {
            if (input[1] < 4077.0) {
                var25 = 2.3808088;
            } else {
                var25 = 5.089151;
            }
        } else {
            var25 = 10.736972;
        }
    }
    double var26;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[2] < 2960.5) {
                if (input[1] < 2975.0) {
                    var26 = -5.930776;
                } else {
                    if (input[0] < 2916.0) {
                        var26 = -0.9581055;
                    } else {
                        var26 = -3.431836;
                    }
                }
            } else {
                if (input[1] < 3134.0) {
                    if (input[4] < 4901694.0) {
                        var26 = -2.6873286;
                    } else {
                        var26 = -0.7639527;
                    }
                } else {
                    if (input[0] < 3102.0) {
                        var26 = -0.7399854;
                    } else {
                        if (input[2] < 3157.6) {
                            var26 = -2.0344715;
                        } else {
                            var26 = -1.3432713;
                        }
                    }
                }
            }
        } else {
            if (input[1] < 3551.0) {
                if (input[2] < 3423.2) {
                    if (input[1] < 3425.0) {
                        if (input[2] < 3382.0) {
                            var26 = -0.5999227;
                        } else {
                            var26 = -0.123046875;
                        }
                    } else {
                        if (input[0] < 3420.6) {
                            var26 = 0.10047084;
                        } else {
                            var26 = -0.24007487;
                        }
                    }
                } else {
                    if (input[4] < 2467680.0) {
                        if (input[1] < 3473.0) {
                            var26 = -0.33565673;
                        } else {
                            var26 = 0.61189455;
                        }
                    } else {
                        if (input[4] < 3198036.0) {
                            var26 = 0.11912842;
                        } else {
                            var26 = -0.05253296;
                        }
                    }
                }
            } else {
                if (input[2] < 3536.1) {
                    if (input[3] < 3518.8) {
                        var26 = 1.2764307;
                    } else {
                        if (input[4] < 3062943.0) {
                            var26 = 0.052652996;
                        } else {
                            var26 = 0.7999634;
                        }
                    }
                } else {
                    if (input[0] < 3651.0) {
                        if (input[1] < 3600.0) {
                            var26 = 0.45627442;
                        } else {
                            var26 = 1.7164236;
                        }
                    } else {
                        var26 = 0.3984131;
                    }
                }
            }
        }
    } else {
        if (input[0] < 4430.05) {
            if (input[1] < 4160.6) {
                if (input[0] < 3776.1) {
                    var26 = 1.0305299;
                } else {
                    var26 = 3.6523407;
                }
            } else {
                var26 = 5.5626388;
            }
        } else {
            var26 = 11.2796755;
        }
    }
    double var27;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[2] < 2968.0) {
                if (input[1] < 2975.0) {
                    var27 = -5.456323;
                } else {
                    var27 = -2.9812927;
                }
            } else {
                if (input[2] < 3052.0) {
                    if (input[0] < 3019.6) {
                        var27 = -1.5880219;
                    } else {
                        var27 = -2.7258885;
                    }
                } else {
                    if (input[2] < 3218.0) {
                        if (input[3] < 3063.9) {
                            var27 = -0.9188477;
                        } else {
                            var27 = -1.7713159;
                        }
                    } else {
                        if (input[2] < 3220.6) {
                            var27 = -0.16689454;
                        } else {
                            var27 = -1.0883491;
                        }
                    }
                }
            }
        } else {
            if (input[2] < 3462.75) {
                if (input[1] < 3446.2) {
                    if (input[4] < 1720835.0) {
                        if (input[0] < 3401.1) {
                            var27 = -0.015588379;
                        } else {
                            var27 = -0.11035156;
                        }
                    } else {
                        if (input[3] < 3411.7) {
                            var27 = -0.53682685;
                        } else {
                            var27 = -0.22855957;
                        }
                    }
                } else {
                    if (input[4] < 2848125.0) {
                        if (input[2] < 3410.9) {
                            var27 = 0.43390137;
                        } else {
                            var27 = 0.029615885;
                        }
                    } else {
                        if (input[2] < 3405.0) {
                            var27 = -0.52808434;
                        } else {
                            var27 = -0.06612142;
                        }
                    }
                }
            } else {
                if (input[1] < 3600.0) {
                    if (input[3] < 3497.7) {
                        if (input[4] < 2847013.0) {
                            var27 = 0.9568359;
                        } else {
                            var27 = 0.09688721;
                        }
                    } else {
                        if (input[2] < 3498.3) {
                            var27 = 0.102800645;
                        } else {
                            var27 = 0.5511505;
                        }
                    }
                } else {
                    if (input[0] < 3620.4) {
                        if (input[4] < 3584683.0) {
                            var27 = 1.6116384;
                        } else {
                            var27 = 0.390271;
                        }
                    } else {
                        if (input[0] < 3625.0) {
                            var27 = -0.20529786;
                        } else {
                            var27 = 0.98545533;
                        }
                    }
                }
            }
        }
    } else {
        if (input[0] < 4430.05) {
            if (input[1] < 4160.6) {
                if (input[0] < 3925.0) {
                    var27 = 1.8091065;
                } else {
                    if (input[3] < 4108.4) {
                        var27 = 3.6710327;
                    } else {
                        var27 = 1.8753566;
                    }
                }
            } else {
                var27 = 5.043465;
            }
        } else {
            var27 = 10.433692;
        }
    }
    double var28;
    if (input[2] < 3536.1) {
        if (input[3] < 3273.8) {
            if (input[1] < 2975.0) {
                var28 = -5.0198193;
            } else {
                if (input[2] < 3033.0) {
                    if (input[0] < 3019.6) {
                        if (input[1] < 3044.4) {
                            var28 = -2.1602392;
                        } else {
                            var28 = -0.82344973;
                        }
                    } else {
                        var28 = -2.8634942;
                    }
                } else {
                    if (input[1] < 3178.0) {
                        if (input[3] < 3048.3) {
                            var28 = -0.39073488;
                        } else {
                            var28 = -1.7606868;
                        }
                    } else {
                        if (input[4] < 2392472.0) {
                            var28 = -0.3131673;
                        } else {
                            var28 = -1.3226975;
                        }
                    }
                }
            }
        } else {
            if (input[2] < 3415.3) {
                if (input[1] < 3425.0) {
                    if (input[3] < 3292.95) {
                        if (input[0] < 3248.2) {
                            var28 = -0.15854493;
                        } else {
                            var28 = -0.0116088865;
                        }
                    } else {
                        if (input[0] < 3371.1) {
                            var28 = -1.0855021;
                        } else {
                            var28 = -0.46315917;
                        }
                    }
                } else {
                    if (input[0] < 3420.6) {
                        if (input[1] < 3435.3) {
                            var28 = -0.09624512;
                        } else {
                            var28 = 0.36523438;
                        }
                    } else {
                        if (input[4] < 1593791.0) {
                            var28 = 0.22749023;
                        } else {
                            var28 = -0.399037;
                        }
                    }
                }
            } else {
                if (input[2] < 3462.75) {
                    if (input[4] < 2880121.0) {
                        if (input[1] < 3502.0) {
                            var28 = 0.23254192;
                        } else {
                            var28 = -0.2501831;
                        }
                    } else {
                        if (input[0] < 3491.0) {
                            var28 = -0.22800294;
                        } else {
                            var28 = 0.10804444;
                        }
                    }
                } else {
                    if (input[3] < 3497.7) {
                        if (input[4] < 2847013.0) {
                            var28 = 1.0648274;
                        } else {
                            var28 = 0.092041016;
                        }
                    } else {
                        if (input[4] < 3198036.0) {
                            var28 = 0.21037272;
                        } else {
                            var28 = 1.057251;
                        }
                    }
                }
            }
        }
    } else {
        if (input[0] < 4430.05) {
            if (input[1] < 4077.0) {
                if (input[1] < 3600.0) {
                    var28 = 0.405896;
                } else {
                    if (input[4] < 3151053.0) {
                        var28 = 1.9207462;
                    } else {
                        var28 = 0.737736;
                    }
                }
            } else {
                if (input[2] < 4096.95) {
                    if (input[0] < 4070.8) {
                        var28 = 4.9381003;
                    } else {
                        if (input[2] < 4041.05) {
                            var28 = 1.3835734;
                        } else {
                            var28 = 2.924815;
                        }
                    }
                } else {
                    var28 = 4.694522;
                }
            }
        } else {
            var28 = 9.651172;
        }
    }
    double var29;
    if (input[0] < 3761.5) {
        if (input[0] < 3371.1) {
            if (input[2] < 2968.0) {
                if (input[1] < 2975.0) {
                    var29 = -4.6182375;
                } else {
                    if (input[0] < 2916.0) {
                        var29 = -0.6531372;
                    } else {
                        var29 = -2.6863492;
                    }
                }
            } else {
                if (input[1] < 3162.0) {
                    if (input[2] < 3033.0) {
                        if (input[0] < 3019.6) {
                            var29 = -1.3101715;
                        } else {
                            var29 = -2.4242387;
                        }
                    } else {
                        if (input[3] < 3048.3) {
                            var29 = -0.37120363;
                        } else {
                            var29 = -1.6103157;
                        }
                    }
                } else {
                    if (input[4] < 2392472.0) {
                        var29 = -0.29228517;
                    } else {
                        if (input[0] < 3102.0) {
                            var29 = -0.3031006;
                        } else {
                            var29 = -1.1610088;
                        }
                    }
                }
            }
        } else {
            if (input[1] < 3551.0) {
                if (input[2] < 3423.2) {
                    if (input[1] < 3425.0) {
                        if (input[0] < 3405.0) {
                            var29 = -0.2384961;
                        } else {
                            var29 = -0.59058434;
                        }
                    } else {
                        if (input[4] < 2845192.0) {
                            var29 = -0.017311199;
                        } else {
                            var29 = -0.30120677;
                        }
                    }
                } else {
                    if (input[1] < 3473.0) {
                        var29 = -0.3319702;
                    } else {
                        if (input[4] < 2467680.0) {
                            var29 = 0.49289066;
                        } else {
                            var29 = 0.041938923;
                        }
                    }
                }
            } else {
                if (input[2] < 3536.1) {
                    if (input[0] < 3508.0) {
                        var29 = 1.2608887;
                    } else {
                        if (input[1] < 3600.35) {
                            var29 = 0.5197049;
                        } else {
                            var29 = -0.25198567;
                        }
                    }
                } else {
                    if (input[0] < 3651.0) {
                        var29 = 1.2651215;
                    } else {
                        var29 = 0.23319092;
                    }
                }
            }
        }
    } else {
        if (input[0] < 4430.05) {
            if (input[1] < 4118.85) {
                if (input[0] < 4094.4) {
                    var29 = 2.2660482;
                } else {
                    var29 = 0.6261353;
                }
            } else {
                if (input[2] < 4014.35) {
                    var29 = 0.96875;
                } else {
                    if (input[4] < 763161.0) {
                        var29 = 0.986499;
                    } else {
                        var29 = 3.85231;
                    }
                }
            }
        } else {
            var29 = 8.92732;
        }
    }
    return 0.0 + (var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16 + var17 + var18 + var19 + var20 + var21 + var22 + var23 + var24 + var25 + var26 + var27 + var28 + var29);
}
}